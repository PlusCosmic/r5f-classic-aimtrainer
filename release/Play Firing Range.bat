@echo off
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\play.ps1" -Map mp_rr_canyonlands_staging %*
if errorlevel 1 pause
