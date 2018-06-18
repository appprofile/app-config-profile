package com.appprofile.conf;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.config.server.EnableConfigServer;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableAutoConfiguration
@EnableDiscoveryClient
@EnableConfigServer
public class AppConfigApplication {
	private static final Logger logger = LoggerFactory.getLogger(AppConfigApplication.class);
	
	public static void main(String[] args) {		
		SpringApplication.run(AppConfigApplication.class, args);		
		logger.info("Starting Config Server");
	}
}