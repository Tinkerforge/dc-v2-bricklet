#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

# FIXME: This example is incomplete

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_dc_v2'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = 'XYZ' # Change XYZ to the UID of your DC Bricklet 2.0

ipcon = IPConnection.new # Create IP connection
dc = BrickletDCV2.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

# The acceleration has to be smaller or equal to the maximum
# acceleration of the DC motor, otherwise the velocity reached
# callback will be called too early
dc.set_motion 4096, \
              16384 # Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
dc.set_velocity 32767 # Full speed forward (100 %)

# Use velocity reached callback to swing back and forth
# between full speed forward and full speed backward
dc.register_callback(BrickletDCV2::CALLBACK_VELOCITY_REACHED) do |velocity|
  if velocity == 32767
    puts 'Velocity: Full speed forward, now turning backward'
    dc.set_velocity(-32767)
  elsif velocity == -32767
    puts 'Velocity: Full speed backward, now turning forward'
    dc.set_velocity 32767
  else
    puts 'Error' # Can only happen if another program sets velocity
  end
end

# Enable motor power
dc.set_enabled true

puts 'Press key to exit'
$stdin.gets

dc.set_velocity 0 # Stop motor before disabling motor power
sleep 2 # Wait for motor to actually stop: velocity (100 %) / decceleration (50 %/s) = 2 s
dc.set_enabled false # Disable motor power

ipcon.disconnect
