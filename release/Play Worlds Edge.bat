@echo off
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\play.ps1" -Map mp_rr_desertlands_hu %*
if errorlevel 1 pause
