# Play Local for the aim trainer. The R5F launcher's mode rails only read the
# base platform\playlists_r5_patch.txt, so mod playlists never show there.
# This starts the dedicated server and client with the same arguments the
# launcher uses, on the cosmic_aimtrainer playlist.
#
#   powershell -ExecutionPolicy Bypass -File tools\play.ps1 [-Map mp_rr_canyonlands_staging] [-Width 3840 -Height 2160] [-Windowed]

param(
    [string]$GameDir = "C:\Users\harry\Games\R5Flowstate",
    [string]$Map = "mp_rr_canyonlands_staging",
    [string]$Playlist = "cosmic_aimtrainer",
    [int]$Port = 37015,
    [int]$Width = 3840,
    [int]$Height = 2160,
    [switch]$Windowed
)

$ErrorActionPreference = "Stop"

Get-Process r5apex, r5apex_dx12, r5apex_ds -ErrorAction SilentlyContinue | ForEach-Object {
    Write-Host "Stopping running $($_.Name) ($($_.Id))"
    Stop-Process -Id $_.Id -Force
}

$ds = Start-Process -FilePath (Join-Path $GameDir "r5apex_ds.exe") -WorkingDirectory $GameDir -PassThru -WindowStyle Minimized -ArgumentList @(
    "-dedicated", "-port", "$Port", "+sv_allowSendTableTransmitToClients", "1", "+stringtable_compress", "1",
    "+spire_host_visibility", "0", "+sv_cheats", "1", "+launchplaylist", $Playlist, "+map", $Map, "+sv_modPolicy", "0")
Write-Host "Dedicated server pid=$($ds.Id) ($Playlist on $Map)"

# Wait until the server answers on its port (the launcher's "host ready").
$deadline = (Get-Date).AddSeconds(90)
$ready = $false
while ((Get-Date) -lt $deadline -and -not $ds.HasExited) {
    $listening = Get-NetUDPEndpoint -LocalPort $Port -ErrorAction SilentlyContinue
    if ($listening) { $ready = $true; break }
    Start-Sleep -Seconds 1
}
if ($ds.HasExited) { throw "Dedicated server exited early; see platform\logs\server\<newest>\error.log" }
if (-not $ready) { Write-Host "Server port not seen after 90 s, starting the client anyway." }
Start-Sleep -Seconds 5

$mode = if ($Windowed) { "-windowed" } else { "-fullscreen" }
$client = Start-Process -FilePath (Join-Path $GameDir "r5apex_dx12.exe") -WorkingDirectory $GameDir -PassThru -ArgumentList @(
    "-nodiscord", "-allowmultiple", "+timeout_during_load", "600", "-language", "english", "+miles_language", "english",
    $mode, "-width", "$Width", "-height", "$Height", "+connect", "127.0.0.1:$Port")
Write-Host "Client pid=$($client.Id). Close the game, then stop the server with: Stop-Process -Id $($ds.Id)"
