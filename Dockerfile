# Use OpenJDK 17 slim image
FROM openjdk:17-jdk-slim

# Install Maven
RUN apt-get update && apt-get install -y maven

# Set working directory
WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src src

# Build the project (skip tests to make build faster)
RUN mvn clean package -DskipTests

# Expose the port your app will run on
EXPOSE 8080

# Run the JAR
CMD ["java", "-jar", "target/notesapp-0.0.1-SNAPSHOT.jar"]
