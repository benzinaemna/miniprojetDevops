FROM openjdk:17-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the packaged JAR file into the container
COPY target/*.jar app.jar

# Expose the port that your application will run on
EXPOSE 8888

# Define the command to run your application
CMD ["java", "-jar", "app.jar"]
