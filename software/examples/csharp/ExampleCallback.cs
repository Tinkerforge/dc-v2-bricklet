using System;
using System.Threading;
using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "XYZ"; // Change XYZ to the UID of your DC Bricklet 2.0

	// Use velocity reached callback to swing back and forth
	// between full speed forward and full speed backward
	static void VelocityReachedCB(BrickletDCV2 sender, short velocity)
	{
		if(velocity == 32767)
		{
			Console.WriteLine("Velocity: Full speed forward, now turning backward");
			sender.SetVelocity(-32767);
		}
		else if(velocity == -32767)
		{
			Console.WriteLine("Velocity: Full speed backward, now turning forward");
			sender.SetVelocity(32767);
		}
		else
		{
			// Can only happen if another program sets velocity
			Console.WriteLine("Error");
		}
	}

	static void Main()
	{
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletDCV2 dc = new BrickletDCV2(UID, ipcon); // Create device object

		ipcon.Connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// The acceleration has to be smaller or equal to the maximum
		// acceleration of the DC motor, otherwise the velocity reached
		// callback will be called too early
		dc.SetMotion(4096,
		             16384); // Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
		dc.SetVelocity(32767); // Full speed forward (100 %)

		// Register velocity reached callback to function VelocityReachedCB
		dc.VelocityReachedCallback += VelocityReachedCB;

		// Enable motor power
		dc.SetEnabled(true);

		Console.WriteLine("Press enter to exit");
		Console.ReadLine();

		dc.SetVelocity(0); // Stop motor before disabling motor power
		Thread.Sleep(2000); // Wait for motor to actually stop: velocity (100 %) / decceleration (50 %/s) = 2 s
		dc.SetEnabled(false); // Disable motor power

		ipcon.Disconnect();
	}
}
