# Use an official OpenJDK runtime as a parent image
FROM openjdk:17

# Create a volume pointing to /tmp. This is good for temporary data that survives restarts of the container.
VOLUME /tmp

# Expose port 8080 to the outside once the container has launched. This is the standard port for Spring Boot applications.
EXPOSE 8080

# Use an argument to specify the jar file name during the build. This allows us to pass in different names for the jar file.
ARG JAR_FILE=target/*.jar

# Copy the jar file into the container at location /app.jar
ADD ${JAR_FILE} app.jar

# Specify the command to run the jar file
ENTRYPOINT ["java", "-jar", "/app.jar"]

