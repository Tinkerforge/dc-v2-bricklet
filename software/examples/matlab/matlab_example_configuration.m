function matlab_example_configuration()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletDCV2;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XYZ'; % Change XYZ to the UID of your DC Bricklet 2.0

    ipcon = IPConnection(); % Create IP connection
    dc = handle(BrickletDCV2(UID, ipcon), 'CallbackProperties'); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    dc.setDriveMode(BrickletDCV2.DRIVE_MODE_DRIVE_COAST);
    dc.setPWMFrequency(10000); % Use PWM frequency of 10 kHz
    dc.setMotion(4096, ...
                 16384); % Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
    dc.setVelocity(32767); % Full speed forward (100 %)
    dc.setEnabled(true); % Enable motor power

    input('Press key to exit\n', 's');

    dc.setVelocity(0); % Stop motor before disabling motor power
    pause(2); % Wait for motor to actually stop: velocity (100 %) / decceleration (50 %/s) = 2 s
    dc.setEnabled(false); % Disable motor power

    ipcon.disconnect();
end
