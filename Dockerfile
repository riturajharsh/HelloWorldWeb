# Use Gradle as the parent image instead of Maven
FROM openjdk:15-slim AS GRADLE_BUILD

# Set the working directory inside the container
WORKDIR /app

# Copy the Gradle wrapper and project files
COPY . .

# Build the application using Gradle
RUN ./gradlew build -x test

# Use a lightweight JDK runtime for running the application
FROM openjdk:15-slim AS runtime

# Copy only the built JAR file from the previous stage
COPY --from=GRADLE_BUILD /app/build/libs/*.jar /rest-service-complete.jar

# Set the startup command to execute the JAR
ENTRYPOINT ["java", "-jar", "/rest-service-complete.jar"]
