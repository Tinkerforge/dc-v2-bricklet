var Tinkerforge = require('tinkerforge');

var HOST = 'localhost';
var PORT = 4223;
var UID = 'XYZ'; // Change XYZ to the UID of your DC Bricklet 2.0

var ipcon = new Tinkerforge.IPConnection(); // Create IP connection
var dc = new Tinkerforge.BrickletDCV2(UID, ipcon); // Create device object

ipcon.connect(HOST, PORT,
    function (error) {
        console.log('Error: ' + error);
    }
); // Connect to brickd
// Don't use device before ipcon is connected

ipcon.on(Tinkerforge.IPConnection.CALLBACK_CONNECTED,
    function (connectReason) {
        dc.setDriveMode(Tinkerforge.BrickletDCV2.DRIVE_MODE_DRIVE_COAST);
        dc.setPWMFrequency(10000); // Use PWM frequency of 10 kHz
        dc.setMotion(4096,
                     16384); // Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
        dc.setVelocity(32767); // Full speed forward (100 %)
        dc.setEnabled(true); // Enable motor power
    }
);

console.log('Press key to exit');
process.stdin.on('data',
    function (data) {
        dc.setVelocity(0); // Stop motor before disabling motor power

        setTimeout(function () {
            dc.setEnabled(false); // Disable motor power

            ipcon.disconnect();
            process.exit(0);
        }, 2000); // Wait for motor to actually stop: velocity (100 %) / decceleration (50 %/s) = 2 s
    }
);
