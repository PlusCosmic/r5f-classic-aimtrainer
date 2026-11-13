# Removes the aim trainer from R5 Flowstate. Your saved settings, loadouts and
# presets stay in the game's settings.cfg.
param([string]$GameDir)
$ErrorActionPreference = "Stop"
. (Join-Path $PSScriptRoot "common.ps1")

if (-not $GameDir) { $GameDir = Find-GameDir }
if (-not (Test-GameDir $GameDir)) { throw "R5 Flowstate not found." }
if (Get-Process r5apex, r5apex_dx12, r5apex_ds -ErrorAction SilentlyContinue) {
    throw "R5 Flowstate is running. Close the game, then run Uninstall again."
}

foreach ($d in @((Join-Path $GameDir "mods\$ModFolder"), (Join-Path $GameDir "platform\resource\ui\menus\cosmic_aimtrainer"))) {
    if (Test-Path $d) { Remove-Item -Recurse -Force $d; Write-Host "Removed $d" }
}
$vdf = Join-Path $GameDir "mods\mods.vdf"
if (Test-Path $vdf) {
    $text = Get-Content $vdf -Raw
    $text = [regex]::Replace($text, "[ \t]*`"$([regex]::Escape($ModId))`"\s*`"\d`"[ \t]*\r?\n?", "")
    Set-Content -Path $vdf -Value $text -NoNewline -Encoding ascii
    Write-Host "Removed $ModId from $vdf"
}
Write-Host "Uninstalled."
