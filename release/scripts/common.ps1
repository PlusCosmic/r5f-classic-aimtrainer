# Shared helpers for the release scripts. ASCII only (Windows PowerShell 5.1).

$ModId      = "Cosmic.AimTrainer"
$ModFolder  = "Cosmic-AimTrainer"
$Root       = Split-Path $PSScriptRoot -Parent
$SavedPath  = Join-Path $PSScriptRoot "gamedir.txt"

function Test-GameDir([string]$dir) {
    return $dir -and (Test-Path (Join-Path $dir "r5apex_ds.exe")) -and (Test-Path (Join-Path $dir "r5apex_dx12.exe"))
}

# Order: saved choice, the R5 Flowstate launcher's log, the folder above this
# one, the launcher's usual place, then ask.
function Find-GameDir([switch]$NoPrompt) {
    if (Test-Path $SavedPath) {
        $d = (Get-Content $SavedPath -Raw).Trim()
        if (Test-GameDir $d) { return $d }
    }
    $log = Join-Path $env:LOCALAPPDATA "R5Flowstate\logs\launcher.log"
    if (Test-Path $log) {
        $hit = Select-String -Path $log -Pattern "Install directory:\s*(.+)$" | Select-Object -Last 1
        if ($hit) {
            $d = $hit.Matches[0].Groups[1].Value.Trim()
            if (Test-GameDir $d) { return $d }
        }
    }
    foreach ($d in @((Split-Path $Root -Parent), (Join-Path $env:USERPROFILE "Games\R5Flowstate"))) {
        if (Test-GameDir $d) { return $d }
    }
    if ($NoPrompt) { return $null }

    Write-Host "Couldn't find R5 Flowstate. Pick the folder that has r5apex_dx12.exe in it."
    Add-Type -AssemblyName System.Windows.Forms
    $dlg = New-Object System.Windows.Forms.FolderBrowserDialog
    $dlg.Description = "Select your R5 Flowstate folder (the one with r5apex_dx12.exe)"
    while ($dlg.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        if (Test-GameDir $dlg.SelectedPath) { return $dlg.SelectedPath }
        Write-Host "That folder doesn't have r5apex_dx12.exe and r5apex_ds.exe in it. Try again."
    }
    return $null
}

function Stop-Game {
    $running = Get-Process r5apex, r5apex_dx12, r5apex_ds -ErrorAction SilentlyContinue
    foreach ($p in $running) {
        Write-Host "Closing running $($p.Name) ($($p.Id))"
        Stop-Process -Id $p.Id -Force
    }
    if ($running) { Start-Sleep -Seconds 2 }
}
