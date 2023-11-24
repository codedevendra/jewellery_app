FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /jewellery_app

# Copy the Maven project file (pom.xml) to the container
COPY pom.xml .

# Copy the source code to the container
COPY src ./src

# Build the application
RUN ./mvnw clean install -DskipTests

# Expose the port that your Spring Boot application will run on
EXPOSE 8080

# Specify the command to run the application
CMD ["java", "-jar", "target/jewellery-0.0.1-SNAPSHOT.war"]
