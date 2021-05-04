#!/usr/bin/perl

# FIXME: This example is incomplete

use strict;
use Tinkerforge::IPConnection;
use Tinkerforge::BrickletDCV2;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your DC Bricklet 2.0

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
our $dc = Tinkerforge::BrickletDCV2->new(&UID, $ipcon); # Create device object

# Use velocity reached callback to swing back and forth
# between full speed forward and full speed backward
sub cb_velocity_reached
{
    my ($velocity) = @_;

    if ($velocity == 32767)
    {
        print "Velocity: Full speed forward, now turning backward\n";
        $dc->set_velocity(-32767);
    }   
    elsif ($velocity == -32767)
    {
        print "Velocity: Full speed backward, now turning forward\n";
        $dc->set_velocity(32767);
    }    
    else
    {
        print "Error\n"; # Can only happen if another program sets velocity
    }
}

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# The acceleration has to be smaller or equal to the maximum
# acceleration of the DC motor, otherwise the velocity reached
# callback will be called too early
$dc->set_motion(4096,
                16384); # Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
$dc->set_velocity(32767); # Full speed forward (100 %)

# Register velocity reached callback to subroutine cb_velocity_reached
$dc->register_callback($dc->CALLBACK_VELOCITY_REACHED, 'cb_velocity_reached');

# Enable motor power
$dc->set_enabled(1);

print "Press key to exit\n";
<STDIN>;

$dc->set_velocity(0); # Stop motor before disabling motor power
sleep(2); # Wait for motor to actually stop: velocity (100 %) / decceleration (50 %/s) = 2 s
$dc->set_enabled(0); # Disable motor power

$ipcon->disconnect();
