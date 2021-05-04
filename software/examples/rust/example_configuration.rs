use std::{error::Error, io, thread, time::Duration};
use tinkerforge::{dc_v2_bricklet::*, ip_connection::IpConnection};

const HOST: &str = "localhost";
const PORT: u16 = 4223;
const UID: &str = "XYZ"; // Change XYZ to the UID of your DC Bricklet 2.0.

fn main() -> Result<(), Box<dyn Error>> {
    let ipcon = IpConnection::new(); // Create IP connection.
    let dc = DcV2Bricklet::new(UID, &ipcon); // Create device object.

    ipcon.connect((HOST, PORT)).recv()??; // Connect to brickd.
                                          // Don't use device before ipcon is connected.

    dc.set_drive_mode(DC_V2_BRICKLET_DRIVE_MODE_DRIVE_COAST).recv()?;
    dc.set_pwm_frequency(10000).recv()?; // Use PWM frequency of 10 kHz
    dc.set_motion(4096, 16384).recv()?; // Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
    dc.set_velocity(32767).recv()?; // Full speed forward (100 %)
    dc.set_enabled(true).recv()?; // Enable motor power

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;

    dc.set_velocity(0).recv()?; // Stop motor before disabling motor power
    thread::sleep(Duration::from_millis(2000)); // Wait for motor to actually stop: velocity (100 %) / decceleration (50 %/s) = 2 s
    dc.set_enabled(false).recv()?; // Disable motor power

    ipcon.disconnect();
    Ok(())
}
