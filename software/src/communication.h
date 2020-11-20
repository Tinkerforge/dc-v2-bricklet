/* dc-v2-bricklet
 * Copyright (C) 2020 Olaf Lüke <olaf@tinkerforge.com>
 *
 * communication.h: TFP protocol message handling
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

#ifndef COMMUNICATION_H
#define COMMUNICATION_H

#include <stdint.h>
#include <stdbool.h>

#include "bricklib2/protocols/tfp/tfp.h"
#include "bricklib2/bootloader/bootloader.h"

// Default functions
BootloaderHandleMessageResponse handle_message(const void *data, void *response);
void communication_tick(void);
void communication_init(void);

// Constants

#define DC_V2_DRIVE_MODE_DRIVE_BRAKE 0
#define DC_V2_DRIVE_MODE_DRIVE_COAST 1

#define DC_V2_ERROR_LED_CONFIG_OFF 0
#define DC_V2_ERROR_LED_CONFIG_ON 1
#define DC_V2_ERROR_LED_CONFIG_SHOW_HEARTBEAT 2
#define DC_V2_ERROR_LED_CONFIG_SHOW_ERROR 3

#define DC_V2_BOOTLOADER_MODE_BOOTLOADER 0
#define DC_V2_BOOTLOADER_MODE_FIRMWARE 1
#define DC_V2_BOOTLOADER_MODE_BOOTLOADER_WAIT_FOR_REBOOT 2
#define DC_V2_BOOTLOADER_MODE_FIRMWARE_WAIT_FOR_REBOOT 3
#define DC_V2_BOOTLOADER_MODE_FIRMWARE_WAIT_FOR_ERASE_AND_REBOOT 4

#define DC_V2_BOOTLOADER_STATUS_OK 0
#define DC_V2_BOOTLOADER_STATUS_INVALID_MODE 1
#define DC_V2_BOOTLOADER_STATUS_NO_CHANGE 2
#define DC_V2_BOOTLOADER_STATUS_ENTRY_FUNCTION_NOT_PRESENT 3
#define DC_V2_BOOTLOADER_STATUS_DEVICE_IDENTIFIER_INCORRECT 4
#define DC_V2_BOOTLOADER_STATUS_CRC_MISMATCH 5

#define DC_V2_STATUS_LED_CONFIG_OFF 0
#define DC_V2_STATUS_LED_CONFIG_ON 1
#define DC_V2_STATUS_LED_CONFIG_SHOW_HEARTBEAT 2
#define DC_V2_STATUS_LED_CONFIG_SHOW_STATUS 3

// Function and callback IDs and structs
#define FID_SET_ENABLED 1
#define FID_GET_ENABLED 2
#define FID_SET_VELOCITY 3
#define FID_GET_VELOCITY 4
#define FID_GET_CURRENT_VELOCITY 5
#define FID_SET_MOTION 6
#define FID_GET_MOTION 7
#define FID_FULL_BRAKE 8
#define FID_SET_DRIVE_MODE 9
#define FID_GET_DRIVE_MODE 10
#define FID_SET_PWM_FREQUENCY 11
#define FID_GET_PWM_FREQUENCY 12
#define FID_GET_POWER_STATISTICS 13
#define FID_SET_ERROR_LED_CONFIG 14
#define FID_GET_ERROR_LED_CONFIG 15
#define FID_SET_EMERGENCY_SHUTDOWN_CALLBACK_CONFIGURATION 16
#define FID_GET_EMERGENCY_SHUTDOWN_CALLBACK_CONFIGURATION 17
#define FID_SET_VELOCITY_REACHED_CALLBACK_CONFIGURATION 18
#define FID_GET_VELOCITY_REACHED_CALLBACK_CONFIGURATION 19
#define FID_SET_CURRENT_VELOCITY_CALLBACK_CONFIGURATION 20
#define FID_GET_CURRENT_VELOCITY_CALLBACK_CONFIGURATION 21

#define FID_CALLBACK_EMERGENCY_SHUTDOWN 22
#define FID_CALLBACK_VELOCITY_REACHED 23
#define FID_CALLBACK_CURRENT_VELOCITY 24

typedef struct {
	TFPMessageHeader header;
	bool enabled;
} __attribute__((__packed__)) SetEnabled;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetEnabled;

typedef struct {
	TFPMessageHeader header;
	bool enabled;
} __attribute__((__packed__)) GetEnabled_Response;

typedef struct {
	TFPMessageHeader header;
	int16_t velocity;
} __attribute__((__packed__)) SetVelocity;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetVelocity;

typedef struct {
	TFPMessageHeader header;
	int16_t velocity;
} __attribute__((__packed__)) GetVelocity_Response;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetCurrentVelocity;

typedef struct {
	TFPMessageHeader header;
	int16_t velocity;
} __attribute__((__packed__)) GetCurrentVelocity_Response;

typedef struct {
	TFPMessageHeader header;
	uint16_t acceleration;
	uint16_t deceleration;
} __attribute__((__packed__)) SetMotion;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetMotion;

typedef struct {
	TFPMessageHeader header;
	uint16_t acceleration;
	uint16_t deceleration;
} __attribute__((__packed__)) GetMotion_Response;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) FullBrake;

typedef struct {
	TFPMessageHeader header;
	uint8_t mode;
} __attribute__((__packed__)) SetDriveMode;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetDriveMode;

typedef struct {
	TFPMessageHeader header;
	uint8_t mode;
} __attribute__((__packed__)) GetDriveMode_Response;

typedef struct {
	TFPMessageHeader header;
	uint16_t frequency;
} __attribute__((__packed__)) SetPWMFrequency;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetPWMFrequency;

typedef struct {
	TFPMessageHeader header;
	uint16_t frequency;
} __attribute__((__packed__)) GetPWMFrequency_Response;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetPowerStatistics;

typedef struct {
	TFPMessageHeader header;
	uint16_t voltage;
	uint16_t current;
} __attribute__((__packed__)) GetPowerStatistics_Response;

typedef struct {
	TFPMessageHeader header;
	uint8_t config;
} __attribute__((__packed__)) SetErrorLEDConfig;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetErrorLEDConfig;

typedef struct {
	TFPMessageHeader header;
	uint8_t config;
} __attribute__((__packed__)) GetErrorLEDConfig_Response;

typedef struct {
	TFPMessageHeader header;
	bool enabled;
} __attribute__((__packed__)) SetEmergencyShutdownCallbackConfiguration;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetEmergencyShutdownCallbackConfiguration;

typedef struct {
	TFPMessageHeader header;
	bool enabled;
} __attribute__((__packed__)) GetEmergencyShutdownCallbackConfiguration_Response;

typedef struct {
	TFPMessageHeader header;
	bool enabled;
} __attribute__((__packed__)) SetVelocityReachedCallbackConfiguration;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetVelocityReachedCallbackConfiguration;

typedef struct {
	TFPMessageHeader header;
	bool enabled;
} __attribute__((__packed__)) GetVelocityReachedCallbackConfiguration_Response;

typedef struct {
	TFPMessageHeader header;
	uint32_t period;
	bool value_has_to_change;
} __attribute__((__packed__)) SetCurrentVelocityCallbackConfiguration;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetCurrentVelocityCallbackConfiguration;

typedef struct {
	TFPMessageHeader header;
	uint32_t period;
	bool value_has_to_change;
} __attribute__((__packed__)) GetCurrentVelocityCallbackConfiguration_Response;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) EmergencyShutdown_Callback;

typedef struct {
	TFPMessageHeader header;
	int16_t velocity;
} __attribute__((__packed__)) VelocityReached_Callback;

typedef struct {
	TFPMessageHeader header;
	int16_t velocity;
} __attribute__((__packed__)) CurrentVelocity_Callback;


// Function prototypes
BootloaderHandleMessageResponse set_enabled(const SetEnabled *data);
BootloaderHandleMessageResponse get_enabled(const GetEnabled *data, GetEnabled_Response *response);
BootloaderHandleMessageResponse set_velocity(const SetVelocity *data);
BootloaderHandleMessageResponse get_velocity(const GetVelocity *data, GetVelocity_Response *response);
BootloaderHandleMessageResponse get_current_velocity(const GetCurrentVelocity *data, GetCurrentVelocity_Response *response);
BootloaderHandleMessageResponse set_motion(const SetMotion *data);
BootloaderHandleMessageResponse get_motion(const GetMotion *data, GetMotion_Response *response);
BootloaderHandleMessageResponse full_brake(const FullBrake *data);
BootloaderHandleMessageResponse set_drive_mode(const SetDriveMode *data);
BootloaderHandleMessageResponse get_drive_mode(const GetDriveMode *data, GetDriveMode_Response *response);
BootloaderHandleMessageResponse set_pwm_frequency(const SetPWMFrequency *data);
BootloaderHandleMessageResponse get_pwm_frequency(const GetPWMFrequency *data, GetPWMFrequency_Response *response);
BootloaderHandleMessageResponse get_power_statistics(const GetPowerStatistics *data, GetPowerStatistics_Response *response);
BootloaderHandleMessageResponse set_error_led_config(const SetErrorLEDConfig *data);
BootloaderHandleMessageResponse get_error_led_config(const GetErrorLEDConfig *data, GetErrorLEDConfig_Response *response);
BootloaderHandleMessageResponse set_emergency_shutdown_callback_configuration(const SetEmergencyShutdownCallbackConfiguration *data);
BootloaderHandleMessageResponse get_emergency_shutdown_callback_configuration(const GetEmergencyShutdownCallbackConfiguration *data, GetEmergencyShutdownCallbackConfiguration_Response *response);
BootloaderHandleMessageResponse set_velocity_reached_callback_configuration(const SetVelocityReachedCallbackConfiguration *data);
BootloaderHandleMessageResponse get_velocity_reached_callback_configuration(const GetVelocityReachedCallbackConfiguration *data, GetVelocityReachedCallbackConfiguration_Response *response);
BootloaderHandleMessageResponse set_current_velocity_callback_configuration(const SetCurrentVelocityCallbackConfiguration *data);
BootloaderHandleMessageResponse get_current_velocity_callback_configuration(const GetCurrentVelocityCallbackConfiguration *data, GetCurrentVelocityCallbackConfiguration_Response *response);

// Callbacks
bool handle_emergency_shutdown_callback(void);
bool handle_velocity_reached_callback(void);
bool handle_current_velocity_callback(void);

#define COMMUNICATION_CALLBACK_TICK_WAIT_MS 1
#define COMMUNICATION_CALLBACK_HANDLER_NUM 3
#define COMMUNICATION_CALLBACK_LIST_INIT \
	handle_emergency_shutdown_callback, \
	handle_velocity_reached_callback, \
	handle_current_velocity_callback, \


#endif
