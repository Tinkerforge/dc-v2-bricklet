#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your DC Bricklet 2.0

tinkerforge call dc-v2-bricklet $uid set-drive-mode drive-mode-drive-coast
tinkerforge call dc-v2-bricklet $uid set-pwm-frequency 10000 # Use PWM frequency of 10 kHz
tinkerforge call dc-v2-bricklet $uid set-motion 4096 16384 # Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
tinkerforge call dc-v2-bricklet $uid set-velocity 32767 # Full speed forward (100 %)
tinkerforge call dc-v2-bricklet $uid set-enabled true # Enable motor power

echo "Press key to exit"; read dummy

tinkerforge call dc-v2-bricklet $uid set-velocity 0 # Stop motor before disabling motor power
sleep 2 # Wait for motor to actually stop: velocity (100 %) / decceleration (50 %/s) = 2 s
tinkerforge call dc-v2-bricklet $uid set-enabled false # Disable motor power
