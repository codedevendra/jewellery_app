FROM openjdk:11-jre-slim
VOLUME /tmp
COPY target/*.war jewellery-0.0.1-SNAPSHOT.war
ENTRYPOINT ["java","-jar","/jewellery-0.0.1-SNAPSHOT.war"]




# Build the application
#RUN ./mvnw clean install -DskipTests

# Expose the port that your Spring Boot application will run on
EXPOSE 8080

# Specify the command to run the application
CMD ["java", "-jar", "./target/jewellery-0.0.1-SNAPSHOT.war"]
