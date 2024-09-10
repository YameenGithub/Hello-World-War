# Use the official Maven image to build the app
FROM maven:3.8.1-openjdk-11 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

# Use Tomcat as the base image to deploy the WAR
FROM tomcat:9.0
COPY --from=build /app/target/helloworld.war /usr/local/tomcat/webapps/helloworld.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
