// This example is not self-contained.
// It requires usage of the example driver specific to your platform.
// See the HAL documentation.

#include "src/bindings/hal_common.h"
#include "src/bindings/bricklet_dc_v2.h"

void check(int rc, const char *msg);
void example_setup(TF_HAL *hal);
void example_loop(TF_HAL *hal);

static TF_DCV2 dc;

void example_setup(TF_HAL *hal) {
	// Create device object
	check(tf_dc_v2_create(&dc, NULL, hal), "create device object");

	check(tf_dc_v2_set_drive_mode(&dc,
	                              TF_DC_V2_DRIVE_MODE_DRIVE_COAST), "call set_drive_mode");
	check(tf_dc_v2_set_pwm_frequency(&dc,
	                                 10000), "call set_pwm_frequency"); // Use PWM frequency of 10 kHz
	check(tf_dc_v2_set_motion(&dc, 4096,
	                          16384), "call set_motion"); // Slow acceleration (12.5 %/s), fast decceleration (50 %/s) for stopping
	check(tf_dc_v2_set_velocity(&dc,
	                            32767), "call set_velocity"); // Full speed forward (100 %)
	check(tf_dc_v2_set_enabled(&dc, true), "call set_enabled"); // Enable motor power
}

void example_loop(TF_HAL *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
