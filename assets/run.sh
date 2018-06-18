#!/bin/bash

# JVM ENV
export JVM_PERM_SIZE=${JVM_PERM_SIZE:-500m}
export JVM_MAX_PERM_SIZE=${JVM_MAX_PERM_SIZE:-500m}
export JVM_XMS=${JVM_XMS:-1024m}
export JVM_XMX=${JVM_XMX:-1024m}
export JVM_G1_HEAP_REGION_SIZE=${JVM_G1_HEAP_REGION_SIZE:-2m}

# JMX ENV
export RMI_HOSTNAME=${RMI_HOSTNAME:-0.0.0.0}
export JMX_PORT=${JMX_PORT:-10001}
export JMX_USER=${JMX_USER:-admin}
export JMX_PASSWORD=${JMX_PASSWORD:-@dmin}
export JMX_READ_USER=${JMX_READ_USER:-monitor}
export JMX_READ_PASSWORD=${JMX_READ_PASSWORD:-monit@r}

# Generate jmxremote.password
if [ ! -f /jmxremote.password ]; then
	echo "Generating jmxremote.password..."
	envsubst < /.setup/jmxremote.password > /jmxremote.password
fi

# Generate jmxremote.access
if [ ! -f /jmxremote.access ]; then
	echo "Generating jmxremote.access..."
	envsubst < /.setup/jmxremote.access > /jmxremote.access
fi

# Generate setenv.sh
# JAVA_OPTS
if [ ! -f /setenv.sh ]; then
	echo "Generating setenv.sh..."
	envsubst < /.setup/setenv.sh > /setenv.sh
fi

# Start version-certifier
# /dev/./urandom es necesaria para optimizar el despliegue con Tomcat de SpringBoot.
java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app-config-profile.jar
echo "Service started."
