import com.tinkerforge.IPConnection;
import com.tinkerforge.BrickletDCV2;

public class ExampleConfiguration {
	private static final String HOST = "localhost";
	private static final int PORT = 4223;

	// Change XYZ to the UID of your DC Bricklet 2.0
	private static final String UID = "XYZ";

	// Note: To make the example code cleaner we do not handle exceptions. Exceptions
	//       you might normally want to catch are described in the documentation
	public static void main(String args[]) throws Exception {
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletDCV2 dc = new BrickletDCV2(UID, ipcon); // Create device object

		ipcon.connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		dc.setDriveMode(BrickletDCV2.DRIVE_MODE_DRIVE_COAST);
		dc.setPWMFrequency(10000); // Use PWM frequency of 10 kHz
		dc.setMotion(4096,
		             16384); // Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
		dc.setVelocity(32767); // Full speed forward (100 %)
		dc.setEnabled(true); // Enable motor power

		System.out.println("Press key to exit"); System.in.read();

		dc.setVelocity(0); // Stop motor before disabling motor power
		Thread.sleep(2000); // Wait for motor to actually stop: velocity (100 %) / decceleration (50 %/s) = 2 s
		dc.setEnabled(false); // Disable motor power

		ipcon.disconnect();
	}
}
