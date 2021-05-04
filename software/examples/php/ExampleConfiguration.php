<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletDCV2.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletDCV2;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change XYZ to the UID of your DC Bricklet 2.0

$ipcon = new IPConnection(); // Create IP connection
$dc = new BrickletDCV2(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

$dc->setDriveMode(BrickletDCV2::DRIVE_MODE_DRIVE_COAST);
$dc->setPWMFrequency(10000); // Use PWM frequency of 10 kHz
$dc->setMotion(4096,
               16384); // Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
$dc->setVelocity(32767); // Full speed forward (100 %)
$dc->setEnabled(TRUE); // Enable motor power

echo "Press key to exit\n";
fgetc(fopen('php://stdin', 'r'));

$dc->setVelocity(0); // Stop motor before disabling motor power
sleep(2); // Wait for motor to actually stop: velocity (100 %) / decceleration (50 %/s) = 2 s
$dc->setEnabled(FALSE); // Disable motor power

$ipcon->disconnect();

?>
