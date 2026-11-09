# Copies the mod into the R5 Flowstate install and enables it in mods.vdf.
# The mod system refuses symlinks/junctions, so this is a plain copy.
#
#   powershell -ExecutionPolicy Bypass -File tools\deploy.ps1 [-GameDir <path>]

param(
    [string]$GameDir = "C:\Users\harry\Games\R5Flowstate"
)

$ErrorActionPreference = "Stop"
$ModId = "Cosmic.AimTrainer"
$FolderName = "Cosmic-AimTrainer"

$src = Join-Path $PSScriptRoot "..\mod" | Resolve-Path
$modsDir = Join-Path $GameDir "mods"
$dst = Join-Path $modsDir $FolderName

if (-not (Test-Path $modsDir)) { throw "No mods folder at $modsDir" }

if (Test-Path $dst) { Remove-Item -Recurse -Force $dst }
Copy-Item -Recurse $src $dst
Write-Host "Copied mod to $dst"

# The engine only resolves .menu/.res files from platform\, never from a mod
# folder (verified in game: AddMenu built an empty menu), and the mod system
# refuses a mod that ships resource\ui\... ("outside its namespace"). So the
# layouts live in platform_ui\ in this repo and are copied into platform\.
$uiSrc = Join-Path $PSScriptRoot "..\platform_ui\cosmic_aimtrainer"
$uiDst = Join-Path $GameDir "platform\resource\ui\menus\cosmic_aimtrainer"
if (Test-Path $uiSrc) {
    if (Test-Path $uiDst) { Remove-Item -Recurse -Force $uiDst }
    Copy-Item -Recurse $uiSrc $uiDst
    Write-Host "Copied menu layouts to $uiDst"
}

# Enable in mods.vdf ("ModList" { "<id>" "1" })
$vdf = Join-Path $modsDir "mods.vdf"
$text = if (Test-Path $vdf) { Get-Content $vdf -Raw } else { "`"ModList`"`r`n{`r`n}`r`n" }
if ($text -match [regex]::Escape("`"$ModId`"")) {
    $text = [regex]::Replace($text, "(`"$([regex]::Escape($ModId))`"\s*)`"\d`"", "`$1`"1`"")
} else {
    $text = $text -replace "\}\s*$", "`t`"$ModId`"`t`"1`"`r`n}`r`n"
}
Set-Content -Path $vdf -Value $text -NoNewline -Encoding ascii
Write-Host "Enabled $ModId in $vdf"
