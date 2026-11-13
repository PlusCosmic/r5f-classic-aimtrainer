# Aim Trainer (Classic) for R5 Flowstate

A port of the R5Reloaded Flowstate Aim Trainer ("Challenges" by Colombia) to
R5 Flowstate, packaged as a Flowstate mod (`Cosmic.AimTrainer`).

Status: early. Server, client and UI scripts compile and run in game on
Firing Range (Classic); drills and menus are being tested.

## Layout

| Path | What |
|---|---|
| `mod/` | The mod exactly as it goes into `<game>/mods/Cosmic-AimTrainer/` |
| `mod/mod.vdf` | Mod manifest + client settings / storage ConVars (`cosmic_aimtrainer_*`) |
| `mod/playlists_r5_patch.txt` | Adds the `cosmic_aimtrainer` playlist |
| `mod/scripts/vscripts/cosmic_aimtrainer/` | Scripts. `sh_` shared, `sv_` server, `cl_` client, `ui_` UI |
| `platform_ui/cosmic_aimtrainer/` | Menu layouts, copied to `<game>/platform/resource/ui/menus/cosmic_aimtrainer/` |
| `tools/deploy.ps1` | Copy the mod + menu layouts into the game and enable the mod |
| `tools/play.ps1` | Start the dedicated server + client on the aim trainer playlist |
| `tools/test-dedi.ps1` | Boot only the dedicated server and print script/mod log lines |

## Install / develop

```powershell
powershell -ExecutionPolicy Bypass -File tools\deploy.ps1
powershell -ExecutionPolicy Bypass -File tools\play.ps1
```

`play.ps1` takes `-Map <stem>` (default `mp_rr_canyonlands_staging`, Firing
Range (Classic)) and `-Windowed`.

### Why not just a mod folder?

Two Flowstate limits (as of client `R5pc_r5-211`, Nov 2026):

- **Menus:** the engine loads `.menu`/`.res` files only from `platform\`, and
  the mod system refuses a mod that ships `resource\ui\...`. So the menu
  layouts are copied into `platform\` by `deploy.ps1`. A launcher repair may
  remove them; re-run the deploy.
- **Launcher:** Play Local only lists playlists from the base
  `platform\playlists_r5_patch.txt`, never a mod's patch, so use `play.ps1`.
  The game itself loads the mod playlist fine.

### Debugging

- Server script errors: `<game>\platform\logs\server\<newest>\error.log`.
  Plain `printt` isn't written to server logs, so important server lines use
  `Warning()` and land in `script_warning.log`.
- Client/UI compile errors: `<game>\platform\logs\dev_inject_diag.log`
  (`COMPILE ERROR [UI]` / `[CLIENT]`). A UI compile error stops the client at
  startup with `Init_PostVideo() failed`.
- Runtime prints are in the in-game console, prefixed `[CosmicAimTrainer]`.
- Squirrel gotchas hit so far: you can't assign a whole struct (`a = b`;
  declare `T x = file.y` instead, which is a reference), and `parent` is a
  reserved word.

### Original sources

The R5R originals aren't redistributed here (see NOTICE). Compare against an
R5Reloaded install (`platform\scripts\vscripts\gamemodes\fs_aimtrainer\`,
`...\ui\FRChallenges\`, `platform\scripts\resource\ui\menus\FRChallenges\`)
or [Mauler125/r5_flowstate](https://github.com/Mauler125/r5_flowstate).
A local, git-ignored copy in `reference/` is handy for diffing.

## Architecture

- **Per-player sessions** (`CATSession` in `sv_cat_core.gnut`): settings,
  spawned entities, stats and best scores belong to one player. The original
  used globals, so players on one server overwrote each other.
- **Drills** register a start function with `CAT_RegisterDrillStart`; the
  core ends the challenge on time-out, exit or death and cleans up everything
  the drill spawned. See the contract at the top of `sv_cat_core.gnut`.
- **Networking**: server -> client via `CAT_CL_*` remote functions
  (registered in `sh_cat_core.gnut`, same order on both VMs); client/UI ->
  server via one client command, `cosmic_aimtrainer <verb> ...`.
- **Settings** are client ConVars (archived), pushed to the server on level
  load and on change.
- **UI**: custom menus registered after the base `InitMenus()`; if they fail
  to load, the same features are offered as Dev Menu pages.
- **History**: every challenge that shows results is sent with
  `CAT_CL_HistoryAdd`; the client adds the weapon it sampled during the drill
  and the UI VM keeps the list for the game session (HISTORY tab). The
  original's "Export to .txt" is not ported: `DevTextBufferDumpToFile`
  returns false and writes nothing on this build (client and dedicated
  server, checked 2026-11-13).
- **Saved loadouts, presets, playlists** (`ui_cat_storage.gnut`): stored in
  archived string ConVars (see below), so they survive restarts.
  - *Loadouts* (6): the weapon selector's bottom bar saves the current
    loadout (same name = overwrite, else first free slot), equips (both
    slots) or deletes (click X twice). The main menu shows them as quick
    buttons under "Current weapon". Every weapon given through the selector
    (or a loadout) is also stored as the *last used* loadout, which is given
    again on the first main menu of every match. An empty secondary leaves
    the current secondary alone.
  - *Presets* (12, ROUTINES tab): a drill + all settings + optionally a saved
    loadout. Run writes the settings ConVars (the SETTINGS tab shows them),
    then sends changed `set`s, `weapon`s and `start <id>`.
  - *Playlists* (6, ROUTINES tab): up to 20 preset steps, repeated 1-20
    times. The UI drives it: each results screen shows the step and
    auto-continues after 5 s (NEXT NOW / STOP PLAYLIST; RESTART reruns the
    step), the last one leads to a per-step summary. Opening the main menu
    (MAIN MENU, Esc on results) stops the playlist.
  - Commands the UI sends for these go out one per 0.1 s
    (`sv_quota_stringCmdsPerSecond`). A `start` sent from the results
    screen makes the server end the results first (it sends the main menu,
    which the UI ignores while a start is pending).
  - DevMenu fallback: loadouts save/equip/delete, presets run/delete/new
    from current settings, playlists run/delete, results next/stop, summary.
    Editing presets and making playlists need the custom ROUTINES menu.
- **Menu camera**: while the idle menu is open the client flies a menu camera
  (`CAT_CL_MenuCamera_Thread`) over per-map spots in `CAT_CL_GetCameraSpots`,
  or orbits the player on other maps. It stops on challenge start, results
  and menu close, and ends itself if no menu is open.
- **Maps**: arena positions are per map in `CAT_LoadMapPositions`. Only
  Firing Range (Classic) has verified positions; S21 map versions use the
  old R5R coordinates (unverified) or fall back to the spawn point. With
  `sv_cheats 1`, `cmd cosmic_aimtrainer pos` prints a position to add.

## Storage format

One item per ARCHIVE string ConVar in `mod.vdf` (`"Values" { "default" "-" }`,
no min/max; `-` = empty slot), written by the UI with `SetConVarString` and
saved to `<Saved Games>\Respawn\Apex_r5f\local\settings.cfg`. Values are at
most 240 chars of `[A-Za-z0-9 _.,:|+=~-]` (the SDK refuses quotes and line
breaks; `;` would split a config line). Names are cut to `[A-Za-z0-9 _-]`,
24 chars. A weapon is `weaponRef:mod1+mod2+...`.

| ConVar | Value |
|---|---|
| `cosmic_aimtrainer_lo0p`..`lo5p` | `Name\|weapon` (loadout name + primary) |
| `cosmic_aimtrainer_lo0s`..`lo5s` | `weapon` or `-` (secondary) |
| `cosmic_aimtrainer_lastp` / `_lasts` | last used primary / secondary |
| `cosmic_aimtrainer_pr0`..`pr11` | `Name\|drillId\|duration\|infinite\|shield\|speed\|distance\|health\|color\|immortal\|reloadhit\|reloadkill\|loadoutSlot` (0 = keep current weapons, 1-6) |
| `cosmic_aimtrainer_pl0`..`pl5` | `Name\|repeats\|presetIdx,presetIdx,...` (0-based, up to 20) |

Deleting a preset leaves playlist steps pointing at it; they are skipped.

## Not ported yet

Armor Swap drill, history export, RGB HUD, play-as-dummy, localization. (The original
weapon selector stopped the menu camera; here it keeps flying.)

## Credits

- Original aim trainer: CafeFPS ("Colombia") and the Flowstate / R5Reloaded
  contributors — [Mauler125/r5_flowstate](https://github.com/Mauler125/r5_flowstate).
- [R5Flowstate](https://github.com/R5Flowstate), whose
  [s21-platform](https://github.com/R5Flowstate/s21-platform) this builds on.

## License

AGPL-3.0 (see [LICENSE](LICENSE)), because the mod is a derivative of
R5Flowstate's AGPL-3.0 s21-platform. Read [NOTICE](NOTICE) first: the
original R5R aim trainer it ports has no license, and Respawn/EA material is
not licensed by this project.

Not affiliated with Electronic Arts, Respawn Entertainment, R5Reloaded or
R5Flowstate.
