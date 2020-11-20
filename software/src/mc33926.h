/* dc-v2-bricklet
 * Copyright (C) 2020 Olaf Lüke <olaf@tinkerforge.com>
 *
 * mc33926.h: Driver for MC33926
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

#ifndef MC33926_H
#define MC33926_H

#include <stdint.h>
#include <stdbool.h>

#include "bricklib2/utility/led_flicker.h"

typedef struct {
	int16_t velocity;
	int32_t velocity_current_high_res;

	uint16_t acceleration;
	uint16_t deceleration;
	uint16_t pwm_frequency;

	bool full_brake;
	bool enabled;

	uint8_t drive_mode;

	LEDFlickerState error_led_flicker_state;

	uint16_t max_duty_cycle;

	bool cb_emergency_shutdown_enabled;
	bool cb_velocity_reached_enabled;
	uint32_t cb_curent_velocity_period;
	bool cb_current_velocity_value_has_to_change;

	bool velocity_reached;
	bool emergency_shutdown;

	bool nfault;
	uint32_t nfault_last_time;
} MC33926;

extern MC33926 mc33926;

void mc33926_init(void);
void mc33926_tick(void);

#endif