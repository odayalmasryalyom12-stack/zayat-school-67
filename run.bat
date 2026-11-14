@echo off
cd /d "%~dp0"

where python >nul 2>nul
if errorlevel 1 (
  echo Python was not found, so the page opens directly. Use Chrome or Edge.
  start "" "%~dp0login.html"
  pause
  exit /b
)

echo Starting the site at http://localhost:8000/login.html
start "" /b python -m http.server 8000
timeout /t 2 /nobreak >nul
start "" http://localhost:8000/login.html

echo.
echo The site is running. Close this window to stop it.
pause >nul
