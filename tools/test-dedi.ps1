# Boots the R5 Flowstate dedicated server on the aim trainer playlist, waits,
# then prints mod/script lines from the new server log and stops the server.
# Catches server-side script compile errors without launching the game client.
#
#   powershell -ExecutionPolicy Bypass -File tools\test-dedi.ps1 [-Map mp_rr_canyonlands_staging] [-Seconds 90]

param(
    [string]$GameDir = "C:\Users\harry\Games\R5Flowstate",
    [string]$Map = "mp_rr_canyonlands_staging",
    [string]$Playlist = "cosmic_aimtrainer",
    [int]$Port = 37099,
    [int]$Seconds = 90
)

$ErrorActionPreference = "Stop"
$logRoot = Join-Path $GameDir "platform\logs\server"
$before = @(Get-ChildItem $logRoot -Directory -ErrorAction SilentlyContinue | ForEach-Object FullName)

$exe = Join-Path $GameDir "r5apex_ds.exe"
$dsArgs = @("-dedicated", "-port", "$Port", "+sv_allowSendTableTransmitToClients", "1", "+stringtable_compress", "1",
          "+spire_host_visibility", "0", "+sv_cheats", "1", "+launchplaylist", $Playlist, "+map", $Map, "+sv_modPolicy", "0",
          "+modsystem_debug", "1", "+playlist_debug", "1")
$proc = Start-Process -FilePath $exe -ArgumentList $dsArgs -WorkingDirectory $GameDir -PassThru -WindowStyle Minimized
Write-Host "Started dedi pid=$($proc.Id); waiting $Seconds s"

$deadline = (Get-Date).AddSeconds($Seconds)
while ((Get-Date) -lt $deadline -and -not $proc.HasExited) { Start-Sleep -Seconds 2 }
$exited = $proc.HasExited
if (-not $exited) { Stop-Process -Id $proc.Id -Force }

$new = Get-ChildItem $logRoot -Directory | Where-Object { $before -notcontains $_.FullName } | Sort-Object LastWriteTime -Descending | Select-Object -First 1
if (-not $new) { Write-Host "No new server log folder found."; exit 1 }
Write-Host "Server log: $($new.FullName) (exited on its own: $exited)"


$pattern = 'MOD-|CosmicAimTrainer|cosmic_aimtrainer|SCRIPT ERROR|script error|COMPILE|Compile error|CAT_|for_mod|playlist'
Get-ChildItem $new.FullName -File | ForEach-Object {
    $hits = Select-String -Path $_.FullName -Pattern $pattern
    if ($hits) {
        Write-Host "== $($_.Name)"
        $hits | Select-Object -First 80 | ForEach-Object { $_.Line }
    }
}
