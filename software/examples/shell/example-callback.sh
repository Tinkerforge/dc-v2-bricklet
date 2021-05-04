#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your DC Bricklet 2.0

# The acceleration has to be smaller or equal to the maximum
# acceleration of the DC motor, otherwise the velocity reached
# callback will be called too early
tinkerforge call dc-v2-bricklet $uid set-motion 4096 16384 # Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
tinkerforge call dc-v2-bricklet $uid set-velocity 32767 # Full speed forward (100 %)

# Use velocity reached callback to swing back and forth
# between full speed forward and full speed backward
tinkerforge dispatch dc-v2-bricklet $uid velocity-reached\
 --execute "if   [ {velocity} -eq  32767 ]; then tinkerforge call dc-v2-bricklet $uid set-velocity -32767;
            elif [ {velocity} -eq -32767 ]; then tinkerforge call dc-v2-bricklet $uid set-velocity  32767;
            else echo error; fi" &

# Enable motor power
tinkerforge call dc-v2-bricklet $uid set-enabled true

echo "Press key to exit"; read dummy

tinkerforge call dc-v2-bricklet $uid set-velocity 0 # Stop motor before disabling motor power
sleep 2 # Wait for motor to actually stop: velocity (100 %) / decceleration (50 %/s) = 2 s
tinkerforge call dc-v2-bricklet $uid set-enabled false # Disable motor power

kill -- -$$ # Stop callback dispatch in background
