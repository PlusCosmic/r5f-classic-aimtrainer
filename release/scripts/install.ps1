# Installs the aim trainer into R5 Flowstate.
#   Install.bat            (or)  install.ps1 [-GameDir <path>]
param([string]$GameDir)
$ErrorActionPreference = "Stop"
. (Join-Path $PSScriptRoot "common.ps1")

if (-not $GameDir) { $GameDir = Find-GameDir }
if (-not (Test-GameDir $GameDir)) { throw "R5 Flowstate not found. Run again and pick the game folder." }
Write-Host "R5 Flowstate: $GameDir"

if (Get-Process r5apex, r5apex_dx12, r5apex_ds -ErrorAction SilentlyContinue) {
    throw "R5 Flowstate is running. Close the game, then run Install again."
}

# 1. The mod itself.
$modsDir = Join-Path $GameDir "mods"
New-Item -ItemType Directory -Force $modsDir | Out-Null
$dst = Join-Path $modsDir $ModFolder
if (Test-Path $dst) { Remove-Item -Recurse -Force $dst }
Copy-Item -Recurse (Join-Path $Root "files\mods\$ModFolder") $dst
Write-Host "Installed the mod to $dst"

# 2. Menu layouts. The game only loads menus from platform\, not from mods.
$uiDst = Join-Path $GameDir "platform\resource\ui\menus\cosmic_aimtrainer"
if (Test-Path $uiDst) { Remove-Item -Recurse -Force $uiDst }
New-Item -ItemType Directory -Force (Split-Path $uiDst -Parent) | Out-Null
Copy-Item -Recurse (Join-Path $Root "files\menus\cosmic_aimtrainer") $uiDst
Write-Host "Installed the menus to $uiDst"

# 3. Switch it on in mods\mods.vdf.
$vdf = Join-Path $modsDir "mods.vdf"
$text = if (Test-Path $vdf) { Get-Content $vdf -Raw } else { "`"ModList`"`r`n{`r`n}`r`n" }
if ($text -match [regex]::Escape("`"$ModId`"")) {
    $text = [regex]::Replace($text, "(`"$([regex]::Escape($ModId))`"\s*)`"\d`"", "`$1`"1`"")
} else {
    $text = $text -replace "\}\s*$", "`t`"$ModId`"`t`"1`"`r`n}`r`n"
}
Set-Content -Path $vdf -Value $text -NoNewline -Encoding ascii
Write-Host "Enabled $ModId in $vdf"

Set-Content -Path $SavedPath -Value $GameDir -Encoding ascii
Write-Host ""
Write-Host "Done. Start it with 'Play Worlds Edge.bat' or 'Play Firing Range.bat'."
