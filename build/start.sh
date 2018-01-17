#!/bin/bash

export DISPLAY=:99

# Start openbox so that vnc is useful
rm /tmp/.X99-lock &> /dev/null
Xvfb :99 -shmem -screen 0 800x600x24& DISPLAY=:99 /usr/bin/openbox-session&
x11vnc -display :99 -N -forever &

# Start b3coin QT
sleep 5
/b3coin/b3coin-qt

# Run tail so the container doesn't quit
tail -f /dev/null
