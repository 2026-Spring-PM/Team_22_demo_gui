@echo off
setlocal

cd /d "%~dp0"

set IMAGE_NAME=team22-demo-gui:0.1.0
set CONTAINER_NAME=team22-demo-gui

docker info >nul 2>&1
if errorlevel 1 (
    echo Docker Desktop is not running or Docker is not installed.
    pause
    exit /b 1
)

docker image inspect %IMAGE_NAME% >nul 2>&1
if errorlevel 1 (
    echo Building Docker image...
    docker build --platform linux/amd64 -t %IMAGE_NAME% .
    if errorlevel 1 (
        echo Docker build failed.
        pause
        exit /b 1
    )
)

docker rm -f %CONTAINER_NAME% >nul 2>&1

echo Starting Team 22 demo...
echo Open this URL in your browser:
echo http://localhost:6080/vnc.html?autoconnect=true^&resize=scale

docker run --rm -it ^
  --platform linux/amd64 ^
  --name %CONTAINER_NAME% ^
  -p 6080:6080 ^
  -v "%cd%":/workspace ^
  %IMAGE_NAME%

pause
