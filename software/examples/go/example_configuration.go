package main

import (
	"fmt"
	"github.com/Tinkerforge/go-api-bindings/dc_v2_bricklet"
	"github.com/Tinkerforge/go-api-bindings/ipconnection"
	"time"
)

const ADDR string = "localhost:4223"
const UID string = "XYZ" // Change XYZ to the UID of your DC Bricklet 2.0.

func main() {
	ipcon := ipconnection.New()
	defer ipcon.Close()
	dc, _ := dc_v2_bricklet.New(UID, &ipcon) // Create device object.

	ipcon.Connect(ADDR) // Connect to brickd.
	defer ipcon.Disconnect()
	// Don't use device before ipcon is connected.

	dc.SetDriveMode(dc_v2_bricklet.DriveModeDriveCoast)
	dc.SetPWMFrequency(10000) // Use PWM frequency of 10 kHz
	dc.SetMotion(4096,
		16384) // Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
	dc.SetVelocity(32767) // Full speed forward (100 %)
	dc.SetEnabled(true)   // Enable motor power

	fmt.Print("Press enter to exit.")
	fmt.Scanln()

	dc.SetVelocity(0)                   // Stop motor before disabling motor power
	time.Sleep(2000 * time.Millisecond) // Wait for motor to actually stop: velocity (100 %) / decceleration (50 %/s) = 2 s
	dc.SetEnabled(false)                // Disable motor power
}
