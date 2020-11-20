/* dc-v2-bricklet
 * Copyright (C) 2020 Olaf Lüke <olaf@tinkerforge.com>
 *
 * mc33926_config.h: Configuration for driver for MC33926
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

#ifndef CONFIG_MC33926_H
#define CONFIG_MC33926_H

#include "xmc_gpio.h"

#define MC33926_D2_PIN         P0_0
#define MC33926_D1_PIN         P0_5
#define MC33926_D1_SLICE       0 // ALT4
#define MC33926_EN_PIN         P0_6
#define MC33926_STATUS_PIN     P0_7
#define MC33926_SLEW_PIN       P0_9
#define MC33926_INV_PIN        P0_8

#define MC33926_IN1_PIN        P1_1
#define MC33926_IN1_SLICE      1 // ALT2
#define MC33926_IN2_PIN        P1_0
#define MC33926_IN2_SLICE      0 // ALT2

#define MC33926_ERROR_LED_PIN  P2_1

#endif