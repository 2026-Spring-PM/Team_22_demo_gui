#!/bin/bash
set -e

cd /workspace

Xvfb :1 -screen 0 1600x1000x24 -ac >/tmp/xvfb.log 2>&1 &
sleep 1

DISPLAY=:1 openbox >/tmp/openbox.log 2>&1 &
x11vnc -display :1 -nopw -forever -shared -rfbport 5900 >/tmp/x11vnc.log 2>&1 &
websockify --web=/usr/share/novnc 6080 localhost:5900 >/tmp/novnc.log 2>&1 &

sleep 0.5

echo "Open http://localhost:6080/vnc.html?autoconnect=true&resize=scale"
DISPLAY=:1 exec /workspace/build/main
