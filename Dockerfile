
# Image.
FROM openjdk:8-jdk

# Maven.
RUN apt-get update && \
    apt-get install -y gettext-base maven && \
    apt-get clean

# Creation of /app-config-profile.
RUN mkdir /app-config-profile
COPY ./app-config-profile /app-config-profile
RUN cd /app-config-profile && \
    mvn clean package -DskipTests=true

# Move the artifact.
RUN mv /app-config-profile/target/app-config-profile*.jar /app-config-profile.jar

# Add files.
COPY ./assets/jmxremote.access /.setup/
COPY ./assets/jmxremote.password /.setup/
COPY ./assets/setenv.sh /.setup/
COPY ./assets/run.sh /

# Needed vol for embeved Spring Boot tomcat.
VOLUME /tmp

# Expose port.
EXPOSE 8082

# Se establecen los permisos de ejecución para el fichero run.sh
RUN chmod a+x /run.sh

# Ejecución del aplicativo.
ENTRYPOINT ["/run.sh"] 