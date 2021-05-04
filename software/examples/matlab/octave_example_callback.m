function octave_example_callback()
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "XYZ"; % Change XYZ to the UID of your DC Bricklet 2.0

    ipcon = javaObject("com.tinkerforge.IPConnection"); % Create IP connection
    dc = javaObject("com.tinkerforge.BrickletDCV2", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % The acceleration has to be smaller or equal to the maximum
    % acceleration of the DC motor, otherwise the velocity reached
    % callback will be called too early
    dc.setMotion(4096, ...
                 16384); % Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
    dc.setVelocity(32767); % Full speed forward (100 %)

    % Register velocity reached callback to function cb_velocity_reached
    dc.addVelocityReachedCallback(@cb_velocity_reached);

    % Enable motor power
    dc.setEnabled(true);

    input("Press key to exit\n", "s");

    dc.setVelocity(0); % Stop motor before disabling motor power
    pause(2); % Wait for motor to actually stop: velocity (100 %) / decceleration (50 %/s) = 2 s
    dc.setEnabled(false); % Disable motor power

    ipcon.disconnect();
end

% Use velocity reached callback to swing back and forth
% between full speed forward and full speed backward
function cb_velocity_reached(e)
    dc = e.getSource();
    velocity = java2int(e.velocity);

    if velocity == 32767
        fprintf("Velocity: Full speed forward, now turning backward\n");
        dc.setVelocity(-32767);
    elseif velocity == -32767
        fprintf("Velocity: Full speed backward, now turning forward\n");
        dc.setVelocity(32767);
    else
        fprintf("Error\n"); % Can only happen if another program sets velocity
    end
end

function int = java2int(value)
    if compare_versions(version(), "3.8", "<=")
        int = value.intValue();
    else
        int = value;
    end
end
