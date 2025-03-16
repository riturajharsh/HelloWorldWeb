# Use Gradle as the parent image instead of Maven
FROM gradle:8.3-jdk17 AS GRADLE_BUILD

# Set the working directory inside the container
WORKDIR /app

# Copy the Gradle wrapper and project files
COPY . .

# Build the application using Gradle
RUN gradle clean build --no-daemon

# Use a lightweight JDK runtime for running the application
FROM eclipse-temurin:17.0.5_8-jre-alpine

# Copy only the built JAR file from the previous stage
COPY --from=GRADLE_BUILD /app/build/libs/*.jar /rest-service-complete.jar

# Set the startup command to execute the JAR
ENTRYPOINT ["java", "-jar", "/rest-service-complete.jar"]
