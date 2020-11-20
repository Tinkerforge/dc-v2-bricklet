/* dc-v2-bricklet
 * Copyright (C) 2020 Olaf Lüke <olaf@tinkerforge.com>
 *
 * communication.c: TFP protocol message handling
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

#include "communication.h"

#include "bricklib2/utility/communication_callback.h"
#include "bricklib2/protocols/tfp/tfp.h"
#include "bricklib2/hal/system_timer/system_timer.h"

#include "configs/config_mc33926.h"
#include "mc33926.h"
#include "voltage.h"

BootloaderHandleMessageResponse handle_message(const void *message, void *response) {
	switch(tfp_get_fid_from_message(message)) {
		case FID_SET_ENABLED: return set_enabled(message);
		case FID_GET_ENABLED: return get_enabled(message, response);
		case FID_SET_VELOCITY: return set_velocity(message);
		case FID_GET_VELOCITY: return get_velocity(message, response);
		case FID_GET_CURRENT_VELOCITY: return get_current_velocity(message, response);
		case FID_SET_MOTION: return set_motion(message);
		case FID_GET_MOTION: return get_motion(message, response);
		case FID_FULL_BRAKE: return full_brake(message);
		case FID_SET_DRIVE_MODE: return set_drive_mode(message);
		case FID_GET_DRIVE_MODE: return get_drive_mode(message, response);
		case FID_SET_PWM_FREQUENCY: return set_pwm_frequency(message);
		case FID_GET_PWM_FREQUENCY: return get_pwm_frequency(message, response);
		case FID_GET_POWER_STATISTICS: return get_power_statistics(message, response);
		case FID_SET_ERROR_LED_CONFIG: return set_error_led_config(message);
		case FID_GET_ERROR_LED_CONFIG: return get_error_led_config(message, response);
		case FID_SET_EMERGENCY_SHUTDOWN_CALLBACK_CONFIGURATION: return set_emergency_shutdown_callback_configuration(message);
		case FID_GET_EMERGENCY_SHUTDOWN_CALLBACK_CONFIGURATION: return get_emergency_shutdown_callback_configuration(message, response);
		case FID_SET_VELOCITY_REACHED_CALLBACK_CONFIGURATION: return set_velocity_reached_callback_configuration(message);
		case FID_GET_VELOCITY_REACHED_CALLBACK_CONFIGURATION: return get_velocity_reached_callback_configuration(message, response);
		case FID_SET_CURRENT_VELOCITY_CALLBACK_CONFIGURATION: return set_current_velocity_callback_configuration(message);
		case FID_GET_CURRENT_VELOCITY_CALLBACK_CONFIGURATION: return get_current_velocity_callback_configuration(message, response);
		default: return HANDLE_MESSAGE_RESPONSE_NOT_SUPPORTED;
	}
}


BootloaderHandleMessageResponse set_enabled(const SetEnabled *data) {
	mc33926.enabled = data->enabled;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_enabled(const GetEnabled *data, GetEnabled_Response *response) {
	response->header.length = sizeof(GetEnabled_Response);
	response->enabled       = mc33926.enabled;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_velocity(const SetVelocity *data) {
	mc33926.velocity   = data->velocity;
	mc33926.full_brake = false;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_velocity(const GetVelocity *data, GetVelocity_Response *response) {
	response->header.length = sizeof(GetVelocity_Response);
	response->velocity      = mc33926.velocity;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse get_current_velocity(const GetCurrentVelocity *data, GetCurrentVelocity_Response *response) {
	response->header.length = sizeof(GetCurrentVelocity_Response);
	response->velocity      = mc33926.velocity_current_high_res/1000;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_motion(const SetMotion *data) {
	mc33926.acceleration = data->acceleration;
	mc33926.deceleration = data->deceleration;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_motion(const GetMotion *data, GetMotion_Response *response) {
	response->header.length = sizeof(GetMotion_Response);
	response->acceleration  = mc33926.acceleration;
	response->deceleration  = mc33926.deceleration;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse full_brake(const FullBrake *data) {
	mc33926.full_brake = true;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse set_drive_mode(const SetDriveMode *data) {
	if(data->mode > DC_V2_DRIVE_MODE_DRIVE_COAST) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	mc33926.drive_mode = data->mode;

	if(data->mode == DC_V2_DRIVE_MODE_DRIVE_COAST) {
		const XMC_GPIO_CONFIG_t ccu4_alt4_config = {
			.mode                = XMC_GPIO_MODE_OUTPUT_PUSH_PULL_ALT4,
			.input_hysteresis    = XMC_GPIO_INPUT_HYSTERESIS_STANDARD,
			.output_level        = XMC_GPIO_OUTPUT_LEVEL_LOW,
		};

		const XMC_GPIO_CONFIG_t out_low_config = {
			.mode                = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
			.input_hysteresis    = XMC_GPIO_INPUT_HYSTERESIS_STANDARD,
			.output_level        = XMC_GPIO_OUTPUT_LEVEL_LOW,
		};

 		XMC_GPIO_Init(MC33926_IN1_PIN, &out_low_config);
 		XMC_GPIO_Init(MC33926_IN2_PIN, &out_low_config);
 		XMC_GPIO_Init(MC33926_D1_PIN, &ccu4_alt4_config);
	} else {
		const XMC_GPIO_CONFIG_t ccu4_alt2_config = {
			.mode                = XMC_GPIO_MODE_OUTPUT_PUSH_PULL_ALT2,
			.input_hysteresis    = XMC_GPIO_INPUT_HYSTERESIS_STANDARD,
			.output_level        = XMC_GPIO_OUTPUT_LEVEL_LOW,
		};

		const XMC_GPIO_CONFIG_t out_low_config = {
			.mode                = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
			.input_hysteresis    = XMC_GPIO_INPUT_HYSTERESIS_STANDARD,
			.output_level        = XMC_GPIO_OUTPUT_LEVEL_LOW,
		};

 		XMC_GPIO_Init(MC33926_IN1_PIN, &ccu4_alt2_config);
 		XMC_GPIO_Init(MC33926_IN2_PIN, &ccu4_alt2_config);
		XMC_GPIO_Init(MC33926_D1_PIN, &out_low_config);
	}

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_drive_mode(const GetDriveMode *data, GetDriveMode_Response *response) {
	response->header.length = sizeof(GetDriveMode_Response);
	response->mode          = mc33926.drive_mode;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_pwm_frequency(const SetPWMFrequency *data) {
	mc33926.pwm_frequency = data->frequency;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_pwm_frequency(const GetPWMFrequency *data, GetPWMFrequency_Response *response) {
	response->header.length = sizeof(GetPWMFrequency_Response);
	response->frequency     = mc33926.pwm_frequency;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse get_power_statistics(const GetPowerStatistics *data, GetPowerStatistics_Response *response) {
	response->header.length = sizeof(GetPowerStatistics_Response);
	response->voltage       = voltage.voltage;
	response->current       = voltage.current;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_error_led_config(const SetErrorLEDConfig *data) {
	if(data->config > DC_V2_ERROR_LED_CONFIG_SHOW_ERROR) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	mc33926.error_led_flicker_state.config = data->config;
	switch(data->config) {
		case DC_V2_ERROR_LED_CONFIG_OFF:
			XMC_GPIO_SetOutputHigh(MC33926_ERROR_LED_PIN);
			break;

		case DC_V2_ERROR_LED_CONFIG_ON:
			XMC_GPIO_SetOutputLow(MC33926_ERROR_LED_PIN);
			break;

		default: break;
	}

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_error_led_config(const GetErrorLEDConfig *data, GetErrorLEDConfig_Response *response) {
	response->header.length = sizeof(GetErrorLEDConfig_Response);
	response->config        = mc33926.error_led_flicker_state.config;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_emergency_shutdown_callback_configuration(const SetEmergencyShutdownCallbackConfiguration *data) {
	mc33926.cb_emergency_shutdown_enabled = data->enabled;
	mc33926.emergency_shutdown            = false;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_emergency_shutdown_callback_configuration(const GetEmergencyShutdownCallbackConfiguration *data, GetEmergencyShutdownCallbackConfiguration_Response *response) {
	response->header.length = sizeof(GetEmergencyShutdownCallbackConfiguration_Response);
	response->enabled       = mc33926.cb_emergency_shutdown_enabled;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_velocity_reached_callback_configuration(const SetVelocityReachedCallbackConfiguration *data) {
	mc33926.cb_velocity_reached_enabled = data->enabled;
	mc33926.velocity_reached            = false;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_velocity_reached_callback_configuration(const GetVelocityReachedCallbackConfiguration *data, GetVelocityReachedCallbackConfiguration_Response *response) {
	response->header.length = sizeof(GetVelocityReachedCallbackConfiguration_Response);
	response->enabled       = mc33926.cb_velocity_reached_enabled;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_current_velocity_callback_configuration(const SetCurrentVelocityCallbackConfiguration *data) {
	mc33926.cb_curent_velocity_period               = data->period;
	mc33926.cb_current_velocity_value_has_to_change = data->value_has_to_change;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_current_velocity_callback_configuration(const GetCurrentVelocityCallbackConfiguration *data, GetCurrentVelocityCallbackConfiguration_Response *response) {
	response->header.length = sizeof(GetCurrentVelocityCallbackConfiguration_Response);
	response->period              = mc33926.cb_curent_velocity_period;
	response->value_has_to_change = mc33926.cb_current_velocity_value_has_to_change;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}




bool handle_emergency_shutdown_callback(void) {
	static bool is_buffered = false;
	static EmergencyShutdown_Callback cb;

	if(!is_buffered) {
		if(mc33926.emergency_shutdown) {
			tfp_make_default_header(&cb.header, bootloader_get_uid(), sizeof(EmergencyShutdown_Callback), FID_CALLBACK_EMERGENCY_SHUTDOWN);
			mc33926.emergency_shutdown = false;
		} else {
			return false;
		}
	}

	if(bootloader_spitfp_is_send_possible(&bootloader_status.st)) {
		bootloader_spitfp_send_ack_and_message(&bootloader_status, (uint8_t*)&cb, sizeof(EmergencyShutdown_Callback));
		is_buffered = false;
		return true;
	} else {
		is_buffered = true;
	}

	return false;
}

bool handle_velocity_reached_callback(void) {
	static bool is_buffered = false;
	static VelocityReached_Callback cb;

	if(!is_buffered) {
		if(mc33926.velocity_reached) {
			tfp_make_default_header(&cb.header, bootloader_get_uid(), sizeof(VelocityReached_Callback), FID_CALLBACK_VELOCITY_REACHED);
			cb.velocity = mc33926.velocity_current_high_res/1000;
			mc33926.velocity_reached = false;
		} else {
			return false;
		}
	}

	if(bootloader_spitfp_is_send_possible(&bootloader_status.st)) {
		bootloader_spitfp_send_ack_and_message(&bootloader_status, (uint8_t*)&cb, sizeof(VelocityReached_Callback));
		is_buffered = false;
		return true;
	} else {
		is_buffered = true;
	}

	return false;
}

bool handle_current_velocity_callback(void) {
	static bool is_buffered = false;
	static CurrentVelocity_Callback cb;
	static uint32_t last_time = 0;
	static int16_t velocity = 0;

	if(!is_buffered) {
		if((mc33926.cb_curent_velocity_period == 0) || !system_timer_is_time_elapsed_ms(last_time, mc33926.cb_curent_velocity_period)) {
			return false;
		}

		const int16_t velocity_current = mc33926.velocity_current_high_res/1000;
		if(mc33926.cb_current_velocity_value_has_to_change && (velocity == velocity_current)) {
			return false;
		}

		tfp_make_default_header(&cb.header, bootloader_get_uid(), sizeof(CurrentVelocity_Callback), FID_CALLBACK_CURRENT_VELOCITY);
		cb.velocity = velocity_current;

		velocity    = velocity_current;
		last_time   = system_timer_get_ms();
	}

	if(bootloader_spitfp_is_send_possible(&bootloader_status.st)) {
		bootloader_spitfp_send_ack_and_message(&bootloader_status, (uint8_t*)&cb, sizeof(CurrentVelocity_Callback));
		is_buffered = false;
		return true;
	} else {
		is_buffered = true;
	}

	return false;
}

void communication_tick(void) {
	communication_callback_tick();
}

void communication_init(void) {
	communication_callback_init();
}
