/* dc-v2-bricklet
 * Copyright (C) 2020 Olaf Lüke <olaf@tinkerforge.com>
 *
 * mc33926.c: Driver for MC33926
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#include "mc33926.h"

#include "configs/config_mc33926.h"
#include "communication.h"
#include "voltage.h"

#include "bricklib2/utility/util_definitions.h"
#include "bricklib2/hal/ccu4_pwm/ccu4_pwm.h"
#include "bricklib2/hal/system_timer/system_timer.h"

#include "xmc_gpio.h"

MC33926 mc33926;

void mc33926_init(void) {
	memset(&mc33926, 0, sizeof(MC33926));

	const XMC_GPIO_CONFIG_t input_pullup_config = {
		.mode             = XMC_GPIO_MODE_INPUT_PULL_UP,
		.input_hysteresis = XMC_GPIO_INPUT_HYSTERESIS_STANDARD
	};

	const XMC_GPIO_CONFIG_t input_default_config = {
		.mode             = XMC_GPIO_MODE_INPUT_TRISTATE,
		.input_hysteresis = XMC_GPIO_INPUT_HYSTERESIS_STANDARD
	};

	const XMC_GPIO_CONFIG_t output_high_config = {
		.mode         = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
		.output_level = XMC_GPIO_OUTPUT_LEVEL_HIGH
	};

	const XMC_GPIO_CONFIG_t output_low_config = {
		.mode         = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
		.output_level = XMC_GPIO_OUTPUT_LEVEL_LOW
	};

	XMC_GPIO_Init(MC33926_D1_PIN,        &output_low_config);
	XMC_GPIO_Init(MC33926_EN_PIN,        &output_low_config);
	XMC_GPIO_Init(MC33926_D2_PIN,        &output_high_config);
	XMC_GPIO_Init(MC33926_SLEW_PIN,      &output_high_config);
	XMC_GPIO_Init(MC33926_ERROR_LED_PIN, &output_high_config);
	XMC_GPIO_Init(MC33926_STATUS_PIN,    &input_pullup_config);
	XMC_GPIO_Init(MC33926_INV_PIN,       &input_default_config);

	ccu4_pwm_init(MC33926_IN1_PIN,       MC33926_IN1_SLICE, 3200 - 1);
	ccu4_pwm_init(MC33926_IN2_PIN,       MC33926_IN2_SLICE, 3200 - 1);

	mc33926.error_led_flicker_state.config = DC_V2_ERROR_LED_CONFIG_SHOW_ERROR;

	mc33926.acceleration  = 10000;
	mc33926.deceleration  = 10000;
	mc33926.pwm_frequency = 20000;

	mc33926.cb_emergency_shutdown_enabled = true; // Emergency shutdown callback is enabled by default
}

static void mc33926_handle_error_led(const uint32_t t) {
	static uint32_t last_time = 0;

	if(mc33926.error_led_flicker_state.config == DC_V2_ERROR_LED_CONFIG_SHOW_HEARTBEAT) {
		led_flicker_tick(&mc33926.error_led_flicker_state, t, MC33926_ERROR_LED_PIN);
	} else if(mc33926.error_led_flicker_state.config == DC_V2_ERROR_LED_CONFIG_ON) {
		XMC_GPIO_SetOutputLow(MC33926_ERROR_LED_PIN);
	} else if(mc33926.error_led_flicker_state.config == DC_V2_ERROR_LED_CONFIG_OFF) {
		XMC_GPIO_SetOutputHigh(MC33926_ERROR_LED_PIN);
	} else if(mc33926.error_led_flicker_state.config == DC_V2_ERROR_LED_CONFIG_SHOW_ERROR) {
		uint32_t error = 0;
		if(voltage.voltage < 6000) {
			error = 500;
		}

		if(mc33926.nfault) {
			error = 125;
		}

		if(error == 0) {
			XMC_GPIO_SetOutputHigh(MC33926_ERROR_LED_PIN);
		} else {
			if(system_timer_is_time_elapsed_ms(last_time, error)) {
				XMC_GPIO_ToggleOutput(MC33926_ERROR_LED_PIN);
				last_time = system_timer_get_ms();
			}
		}
	}
}


void mc33926_tick_update_frequency(void) {
	// Frequency between 1000 und 50000 corresponds to duty cycle between 1280 and 64000
	uint16_t new_max_duty_cycle = BETWEEN(1280, 64000000/mc33926.pwm_frequency, 64000);

	if(new_max_duty_cycle != mc33926.max_duty_cycle) {
		mc33926.max_duty_cycle = new_max_duty_cycle;
		ccu4_pwm_set_period(MC33926_IN1_SLICE, mc33926.max_duty_cycle - 1);
		ccu4_pwm_set_period(MC33926_IN2_SLICE, mc33926.max_duty_cycle - 1);
	}
}

void mc33926_tick_update_velocity(const uint32_t t) {
	static uint32_t last_t = 0;

	// We increase the veolocty once per ms, if more then
	// one ms has past we increase with an apropriate factor.
	const uint32_t factor = (uint32_t)(t - last_t);
	if(factor == 0) {
		return;
	}

	last_t = t;

	int16_t current_velocity = mc33926.velocity_current_high_res/1000;
	if(mc33926.velocity > current_velocity) {
		if(current_velocity > 0) {
			if(mc33926.acceleration == 0) {
				mc33926.velocity_current_high_res = mc33926.velocity*1000;
			} else {
				mc33926.velocity_current_high_res += MAX(1, mc33926.acceleration)*factor;
			}
		} else {
			if(mc33926.deceleration == 0) {
				mc33926.velocity_current_high_res = mc33926.velocity*1000;
			} else {
				mc33926.velocity_current_high_res += MAX(1, mc33926.deceleration)*factor;
			}
		}
		if(mc33926.velocity*1000 < mc33926.velocity_current_high_res) {
			mc33926.velocity_current_high_res = mc33926.velocity*1000;
		}
	} else if(mc33926.velocity < current_velocity) {
		if(current_velocity > 0) {
			if(mc33926.deceleration == 0) {
				mc33926.velocity_current_high_res = mc33926.velocity*1000;
			} else {
				mc33926.velocity_current_high_res -= MAX(1, mc33926.deceleration)*factor;
			}
		} else {
			if(mc33926.acceleration == 0) {
				mc33926.velocity_current_high_res = mc33926.velocity*1000;
			} else {
				mc33926.velocity_current_high_res -= MAX(1, mc33926.acceleration)*factor;
			}
		}
		if(mc33926.velocity*1000 > mc33926.velocity_current_high_res) {
			mc33926.velocity_current_high_res = mc33926.velocity*1000;
		}
	} else {
		// If velocity is already reached we return here so we never send
		// the velocity reached callback more then once.
		return;
	}

	if(mc33926.velocity == mc33926.velocity_current_high_res/1000) {
		mc33926.velocity_reached = true;
	}
}

void mc33926_tick(void) {
	const uint32_t t = system_timer_get_ms();

//	mc33926_check_nfault();

	if(mc33926.enabled) {
		XMC_GPIO_SetOutputHigh(MC33926_EN_PIN);
	} else {
		XMC_GPIO_SetOutputLow(MC33926_EN_PIN);
	}

	mc33926_tick_update_frequency();
	mc33926_tick_update_velocity(t);
	int32_t new_velocity = mc33926.velocity_current_high_res/1000;

	if(mc33926.full_brake) {
		ccu4_pwm_set_duty_cycle(MC33926_IN1_SLICE, mc33926.max_duty_cycle);
		ccu4_pwm_set_duty_cycle(MC33926_IN2_SLICE, mc33926.max_duty_cycle);
		mc33926.velocity = 0;
		mc33926.velocity_current_high_res = 0;
	} else {
		if(mc33926.drive_mode == DC_V2_DRIVE_MODE_DRIVE_BRAKE) { // drive/brake
			if(new_velocity == 0) {
				ccu4_pwm_set_duty_cycle(MC33926_IN1_SLICE, mc33926.max_duty_cycle);
				ccu4_pwm_set_duty_cycle(MC33926_IN2_SLICE, mc33926.max_duty_cycle);
			} else if(new_velocity < 0) {
				ccu4_pwm_set_duty_cycle(MC33926_IN1_SLICE, mc33926.max_duty_cycle);
				ccu4_pwm_set_duty_cycle(MC33926_IN2_SLICE, mc33926.max_duty_cycle - SCALE(ABS(new_velocity), 0, INT16_MAX, 0, mc33926.max_duty_cycle));
			} else {
				ccu4_pwm_set_duty_cycle(MC33926_IN2_SLICE, mc33926.max_duty_cycle);
				ccu4_pwm_set_duty_cycle(MC33926_IN1_SLICE, mc33926.max_duty_cycle - SCALE(ABS(new_velocity), 0, INT16_MAX, 0, mc33926.max_duty_cycle));
			}
		} else { // drive/coast
			if(new_velocity == 0) {
				XMC_GPIO_SetOutputLow(MC33926_IN1_PIN);
				XMC_GPIO_SetOutputLow(MC33926_IN2_PIN);
			} else if(new_velocity < 0) {
				XMC_GPIO_SetOutputLow(MC33926_IN1_PIN);
				XMC_GPIO_SetOutputHigh(MC33926_IN2_PIN);
			} else {
				XMC_GPIO_SetOutputHigh(MC33926_IN1_PIN);
				XMC_GPIO_SetOutputLow(MC33926_IN2_PIN);
			}

			ccu4_pwm_set_duty_cycle(MC33926_D1_SLICE, SCALE(ABS(new_velocity), 0, INT16_MAX, 0, mc33926.max_duty_cycle));
		}
	}
	
	mc33926_handle_error_led(t);
}