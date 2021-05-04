#!/usr/bin/perl

use strict;
use Tinkerforge::IPConnection;
use Tinkerforge::BrickletDCV2;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your DC Bricklet 2.0

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $dc = Tinkerforge::BrickletDCV2->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

$dc->set_drive_mode($dc->DRIVE_MODE_DRIVE_COAST);
$dc->set_pwm_frequency(10000); # Use PWM frequency of 10 kHz
$dc->set_motion(4096,
                16384); # Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
$dc->set_velocity(32767); # Full speed forward (100 %)
$dc->set_enabled(1); # Enable motor power

print "Press key to exit\n";
<STDIN>;

$dc->set_velocity(0); # Stop motor before disabling motor power
sleep(2); # Wait for motor to actually stop: velocity (100 %) / decceleration (50 %/s) = 2 s
$dc->set_enabled(0); # Disable motor power

$ipcon->disconnect();
