# Use an official Maven image to build the application
FROM maven:3.8.4-openjdk-11-slim AS build

# Set the working directory in the container
WORKDIR /build

# Copy the pom.xml file and the src folder into the container
COPY pom.xml .
COPY src ./src

# Build the application (This will run 'mvn clean package' and build the JAR file)
RUN mvn clean package -DskipTests

# Now, use a smaller JRE image to run the application
FROM adoptopenjdk/openjdk11:alpine-jre

# Set the working directory inside the container for the final image
WORKDIR /opt/app

# Copy the JAR file from the build image into the new image
COPY --from=build /build/target/*.jar app.jar

# Expose port 8080 (default for Spring Boot applications)
EXPOSE 8080

# Run the Spring Boot application when the container starts
ENTRYPOINT ["java", "-jar", "app.jar"]
