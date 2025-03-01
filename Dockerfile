# Use a base image with OpenJDK
FROM adoptopenjdk/openjdk11:alpine-jre

# Set the working directory inside the container to /opt/app
WORKDIR /opt/app

# Copy the JAR file from the build context (GitHub workspace) into the container's working directory
# Assuming the JAR is named app.jar and is located in the root of the workspace after the build
COPY target/my-spring-boot-app.jar app.jar

# Expose the port the app will run on (default Spring Boot port is 8080)
EXPOSE 8080

# Define the entry point to run the JAR file with Java
ENTRYPOINT ["java", "-jar", "app.jar"]
