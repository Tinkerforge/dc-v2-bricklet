#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

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

dc.set_drive_mode BrickletDCV2::DRIVE_MODE_DRIVE_COAST
dc.set_pwm_frequency 10000 # Use PWM frequency of 10 kHz
dc.set_motion 4096, \
              16384 # Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
dc.set_velocity 32767 # Full speed forward (100 %)
dc.set_enabled true # Enable motor power

puts 'Press key to exit'
$stdin.gets

dc.set_velocity 0 # Stop motor before disabling motor power
sleep 2 # Wait for motor to actually stop: velocity (100 %) / decceleration (50 %/s) = 2 s
dc.set_enabled false # Disable motor power

ipcon.disconnect
