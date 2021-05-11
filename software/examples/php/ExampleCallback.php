<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletDCV2.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletDCV2;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change XYZ to the UID of your DC Bricklet 2.0

// Use velocity reached callback to swing back and forth
// between full speed forward and full speed backward
function cb_velocityReached($velocity, $user_data)
{
    $dc = $user_data;

    if ($velocity == 32767) {
        echo "Velocity: Full speed forward, now turning backward\n";
        $dc->setVelocity(-32767);
    } elseif ($velocity == -32767) {
        echo "Velocity: Full speed backward, now turning forward\n";
        $dc->setVelocity(32767);
    } else {
        echo "Error\n"; // Can only happen if another program sets velocity
    }
}

$ipcon = new IPConnection(); // Create IP connection
$dc = new BrickletDCV2(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// The acceleration has to be smaller or equal to the maximum
// acceleration of the DC motor, otherwise the velocity reached
// callback will be called too early
$dc->setMotion(4096,
               16384); // Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
$dc->setVelocity(32767); // Full speed forward (100 %)

// Register velocity reached callback to function cb_velocityReached
$dc->registerCallback(BrickletDCV2::CALLBACK_VELOCITY_REACHED, 'cb_velocityReached', $dc);

// Enable motor power
$dc->setEnabled(TRUE);

echo "Press ctrl+c to exit\n";
$ipcon->dispatchCallbacks(-1); // Dispatch callbacks forever

?>
