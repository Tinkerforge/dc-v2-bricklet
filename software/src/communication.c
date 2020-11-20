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

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_enabled(const GetEnabled *data, GetEnabled_Response *response) {
	response->header.length = sizeof(GetEnabled_Response);

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_velocity(const SetVelocity *data) {

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_velocity(const GetVelocity *data, GetVelocity_Response *response) {
	response->header.length = sizeof(GetVelocity_Response);

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse get_current_velocity(const GetCurrentVelocity *data, GetCurrentVelocity_Response *response) {
	response->header.length = sizeof(GetCurrentVelocity_Response);

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_motion(const SetMotion *data) {

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_motion(const GetMotion *data, GetMotion_Response *response) {
	response->header.length = sizeof(GetMotion_Response);

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse full_brake(const FullBrake *data) {

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse set_drive_mode(const SetDriveMode *data) {

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_drive_mode(const GetDriveMode *data, GetDriveMode_Response *response) {
	response->header.length = sizeof(GetDriveMode_Response);

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_pwm_frequency(const SetPWMFrequency *data) {

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_pwm_frequency(const GetPWMFrequency *data, GetPWMFrequency_Response *response) {
	response->header.length = sizeof(GetPWMFrequency_Response);

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse get_power_statistics(const GetPowerStatistics *data, GetPowerStatistics_Response *response) {
	response->header.length = sizeof(GetPowerStatistics_Response);

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_error_led_config(const SetErrorLEDConfig *data) {

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_error_led_config(const GetErrorLEDConfig *data, GetErrorLEDConfig_Response *response) {
	response->header.length = sizeof(GetErrorLEDConfig_Response);

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_emergency_shutdown_callback_configuration(const SetEmergencyShutdownCallbackConfiguration *data) {

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_emergency_shutdown_callback_configuration(const GetEmergencyShutdownCallbackConfiguration *data, GetEmergencyShutdownCallbackConfiguration_Response *response) {
	response->header.length = sizeof(GetEmergencyShutdownCallbackConfiguration_Response);

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_velocity_reached_callback_configuration(const SetVelocityReachedCallbackConfiguration *data) {

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_velocity_reached_callback_configuration(const GetVelocityReachedCallbackConfiguration *data, GetVelocityReachedCallbackConfiguration_Response *response) {
	response->header.length = sizeof(GetVelocityReachedCallbackConfiguration_Response);

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_current_velocity_callback_configuration(const SetCurrentVelocityCallbackConfiguration *data) {

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_current_velocity_callback_configuration(const GetCurrentVelocityCallbackConfiguration *data, GetCurrentVelocityCallbackConfiguration_Response *response) {
	response->header.length = sizeof(GetCurrentVelocityCallbackConfiguration_Response);

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}




bool handle_emergency_shutdown_callback(void) {
	static bool is_buffered = false;
	static EmergencyShutdown_Callback cb;

	if(!is_buffered) {
		tfp_make_default_header(&cb.header, bootloader_get_uid(), sizeof(EmergencyShutdown_Callback), FID_CALLBACK_EMERGENCY_SHUTDOWN);
		// TODO: Implement EmergencyShutdown callback handling

		return false;
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
		tfp_make_default_header(&cb.header, bootloader_get_uid(), sizeof(VelocityReached_Callback), FID_CALLBACK_VELOCITY_REACHED);
		// TODO: Implement VelocityReached callback handling

		return false;
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

	if(!is_buffered) {
		tfp_make_default_header(&cb.header, bootloader_get_uid(), sizeof(CurrentVelocity_Callback), FID_CALLBACK_CURRENT_VELOCITY);
		// TODO: Implement CurrentVelocity callback handling

		return false;
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
