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
        // The acceleration has to be smaller or equal to the maximum
        // acceleration of the DC motor, otherwise the velocity reached
        // callback will be called too early
        dc.setMotion(4096,
                     16384); // Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
        dc.setVelocity(32767); // Full speed forward (100 %)

        // Enable motor power
        dc.setEnabled(true);
    }
);

// Register velocity reached callback
dc.on(Tinkerforge.BrickletDCV2.CALLBACK_VELOCITY_REACHED,
    // Use velocity reached callback to swing back and forth
    // between full speed forward and full speed backward
    function (velocity) {
        if(velocity == 32767) {
            console.log('Velocity: Full speed forward, now turning backward');
            dc.setVelocity(-32767);
        }
        else if(velocity === -32767) {
            console.log('Velocity: Full speed backward, now turning forward');
            dc.setVelocity(32767);
        }
        else {
            console.log('Error'); // Can only happen if another program sets velocity
        }
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
