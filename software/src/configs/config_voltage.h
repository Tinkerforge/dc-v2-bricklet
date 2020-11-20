/* dc-v2-bricklet
 * Copyright (C) 2020 Olaf Lüke <olaf@tinkerforge.com>
 *
 * config_voltage.h: Config for MC33926 voltage measurements
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

#ifndef CONFIG_VOLTAGE_H
#define CONFIG_VOLTAGE_H

#include "xmc_gpio.h"

#define VOLTAGE_FB_PIN            P2_10
#define VOLTAGE_FB_ALIAS          3
#define VOLTAGE_FB_RESULT_REG     4
#define VOLTAGE_FB_CHANNEL_NUM    0

#define VOLTAGE_VEXT_PIN          P2_11
#define VOLTAGE_VEXT_ALIAS        4
#define VOLTAGE_VEXT_RESULT_REG   5
#define VOLTAGE_VEXT_CHANNEL_NUM  1

#endif
