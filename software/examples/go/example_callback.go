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

	// The acceleration has to be smaller or equal to the maximum
	// acceleration of the DC motor, otherwise the velocity reached
	// callback will be called too early
	dc.SetMotion(4096,
		16384) // Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
	dc.SetVelocity(32767) // Full speed forward (100 %)

	dc.RegisterVelocityReachedCallback(func(velocity int16) {
		if velocity == 32767 {
			fmt.Println("Velocity: Full speed forward, now turning backward")
			dc.SetVelocity(-32767)
		} else if velocity == -32767 {
			fmt.Println("Velocity: Full speed backward, now turning forward")
			dc.SetVelocity(32767)
		} else {
			// Can only happen if another program sets velocity
			fmt.Println("Error")
		}
	})

	// Enable motor power
	dc.SetEnabled(true)

	fmt.Print("Press enter to exit.")
	fmt.Scanln()

	dc.SetVelocity(0)                   // Stop motor before disabling motor power
	time.Sleep(2000 * time.Millisecond) // Wait for motor to actually stop: velocity (100 %) / decceleration (50 %/s) = 2 s
	dc.SetEnabled(false)                // Disable motor power
}
