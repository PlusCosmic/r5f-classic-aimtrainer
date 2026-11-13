# Starts a local server on the aim trainer playlist and joins it.
# The R5 Flowstate launcher can't list mod playlists, so this does what its
# Play Local button does. Closing the game also stops the server.
param(
    [string]$Map = "mp_rr_desertlands_hu",
    [string]$GameDir,
    [int]$Port = 37015,
    [switch]$Windowed
)
$ErrorActionPreference = "Stop"
. (Join-Path $PSScriptRoot "common.ps1")

if (-not $GameDir) { $GameDir = Find-GameDir }
if (-not (Test-GameDir $GameDir)) { throw "R5 Flowstate not found. Run Install.bat first." }
if (-not (Test-Path (Join-Path $GameDir "mods\$ModFolder\mod.vdf"))) { throw "The aim trainer isn't installed in $GameDir. Run Install.bat first." }

Stop-Game

# Real pixel size, not the DPI-scaled one (a 4K screen at 150% reads 2560x1440).
Add-Type -Namespace CAT -Name Dpi -MemberDefinition '[DllImport("user32.dll")] public static extern bool SetProcessDPIAware();'
[CAT.Dpi]::SetProcessDPIAware() | Out-Null
Add-Type -AssemblyName System.Windows.Forms
$screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
$mode = if ($Windowed) { "-windowed" } else { "-fullscreen" }

Write-Host "Starting the server ($Map)..."
$ds = Start-Process -FilePath (Join-Path $GameDir "r5apex_ds.exe") -WorkingDirectory $GameDir -PassThru -WindowStyle Minimized -ArgumentList @(
    "-dedicated", "-port", "$Port", "+sv_allowSendTableTransmitToClients", "1", "+stringtable_compress", "1",
    "+spire_host_visibility", "0", "+sv_cheats", "1", "+launchplaylist", "cosmic_aimtrainer", "+map", $Map, "+sv_modPolicy", "0")

$deadline = (Get-Date).AddSeconds(90)
while ((Get-Date) -lt $deadline -and -not $ds.HasExited) {
    if (Get-NetUDPEndpoint -LocalPort $Port -ErrorAction SilentlyContinue) { break }
    Start-Sleep -Seconds 1
}
if ($ds.HasExited) { throw "The server closed while starting. Check $GameDir\platform\logs\server\ (newest folder, error.log)." }
Start-Sleep -Seconds 5

Write-Host "Starting the game..."
$client = Start-Process -FilePath (Join-Path $GameDir "r5apex_dx12.exe") -WorkingDirectory $GameDir -PassThru -ArgumentList @(
    "-nodiscord", "-allowmultiple", "+timeout_during_load", "600", "-language", "english", "+miles_language", "english",
    $mode, "-width", "$($screen.Width)", "-height", "$($screen.Height)", "+connect", "127.0.0.1:$Port")

Write-Host "Playing. Leave this window open; the server stops when you close the game."
$client.WaitForExit()
if (-not $ds.HasExited) { Stop-Process -Id $ds.Id -Force }
Write-Host "Server stopped."
