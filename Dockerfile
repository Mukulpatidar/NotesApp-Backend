# Use an official OpenJDK 17 image
FROM openjdk:17-jdk-slim

# Set working directory inside the container
WORKDIR /app

# Install Maven (for building the project)
RUN apt-get update && \
    apt-get install -y maven && \
    rm -rf /var/lib/apt/lists/*

# Copy Maven wrapper and project files
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Copy source code
COPY src ./src

# Make mvnw executable
RUN chmod +x mvnw

# Build the Spring Boot project (skip tests)
RUN ./mvnw clean package -DskipTests

# Expose the port your app will run on
EXPOSE 8080

# Run the Spring Boot JAR
CMD ["java", "-jar", "target/notesapp-0.0.1-SNAPSHOT.jar"]
