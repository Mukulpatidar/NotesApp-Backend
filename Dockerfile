# Use official OpenJDK 17 image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy Maven wrapper and pom.xml
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Download dependencies (cache for faster builds)
RUN ./mvnw dependency:go-offline -B

# Copy source code
COPY src src

# Package the app (skip tests to speed up build)
RUN ./mvnw clean package -DskipTests

# Run the jar
CMD ["java", "-jar", "target/notesapp-0.0.1-SNAPSHOT.jar"]
