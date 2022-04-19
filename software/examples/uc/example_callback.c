// This example is not self-contained.
// It requres usage of the example driver specific to your platform.
// See the HAL documentation.

#include "bindings/hal_common.h"
#include "bindings/bricklet_dc_v2.h"

// FIXME: This example is incomplete

#define UID "XYZ" // Change XYZ to the UID of your DC Bricklet 2.0

void check(int rc, const char* msg);

void example_setup(TF_HAL *hal);
void example_loop(TF_HAL *hal);


// Use velocity reached callback to swing back and forth
// between full speed forward and full speed backward
static void velocity_reached_handler(TF_DCV2 *device, int16_t velocity, void *user_data) {
	(void)device; (void)user_data; // avoid unused parameter warning

	tf_hal_printf("Velocity: %I16d\n", velocity);
}

static TF_DCV2 dc;

void example_setup(TF_HAL *hal) {
	// Create device object
	check(tf_dc_v2_create(&dc, UID, hal), "create device object");

	// The acceleration has to be smaller or equal to the maximum
	// acceleration of the DC motor, otherwise the velocity reached
	// callback will be called too early
	check(tf_dc_v2_set_motion(&dc, 4096,
	                          16384), "call set_motion"); // Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
	check(tf_dc_v2_set_velocity(&dc,
	                            32767), "call set_velocity"); // Full speed forward (100 %)

	// Register velocity reached callback to function velocity_reached_handler
	tf_dc_v2_register_velocity_reached_callback(&dc,
	                                            velocity_reached_handler,
	                                            NULL);

	// Enable motor power
	check(tf_dc_v2_set_enabled(&dc, true), "call set_enabled");
}

void example_loop(TF_HAL *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
