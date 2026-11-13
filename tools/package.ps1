# Builds the release zip friends install from: dist\Cosmic-AimTrainer-<version>.zip
#   powershell -ExecutionPolicy Bypass -File tools\package.ps1
$ErrorActionPreference = "Stop"
$repo = Resolve-Path (Join-Path $PSScriptRoot "..")

$vdf = Get-Content (Join-Path $repo "mod\mod.vdf") -Raw
if ($vdf -notmatch '"version"\s*"([^"]+)"') { throw "No version in mod.vdf" }
$version = $Matches[1]
$name = "Cosmic-AimTrainer-$version"

$dist  = Join-Path $repo "dist"
$stage = Join-Path $dist $name
if (Test-Path $stage) { Remove-Item -Recurse -Force $stage }
New-Item -ItemType Directory -Force $stage | Out-Null

Copy-Item -Recurse (Join-Path $repo "release\*") $stage
Remove-Item -Force -ErrorAction SilentlyContinue (Join-Path $stage "scripts\gamedir.txt")
New-Item -ItemType Directory -Force (Join-Path $stage "files\mods"), (Join-Path $stage "files\menus") | Out-Null
Copy-Item -Recurse (Join-Path $repo "mod") (Join-Path $stage "files\mods\Cosmic-AimTrainer")
Copy-Item -Recurse (Join-Path $repo "platform_ui\cosmic_aimtrainer") (Join-Path $stage "files\menus\cosmic_aimtrainer")
Copy-Item (Join-Path $repo "LICENSE"), (Join-Path $repo "NOTICE") $stage

$zip = Join-Path $dist "$name.zip"
if (Test-Path $zip) { Remove-Item -Force $zip }
Compress-Archive -Path $stage -DestinationPath $zip
Remove-Item -Recurse -Force $stage
Write-Host "Built $zip"
