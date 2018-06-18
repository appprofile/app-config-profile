package com.appprofile.conf.controllers;

import static com.appprofile.conf.controllers.AppConfigControllersConstants.CONFIG_URI;
import static com.appprofile.conf.controllers.AppConfigControllersConstants.STATUS_OK;
import static com.appprofile.conf.controllers.AppConfigControllersConstants.STATUS_URI;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 
 * 
 * 
 * Configuration Controller for app-config-profile.
 *
 */
@RestController
@RequestMapping(value = CONFIG_URI)
public class AppConfigController {	

	@GetMapping(value = STATUS_URI)
	public String getAppProfileConfigStatus() {
		return STATUS_OK;
	}
}
