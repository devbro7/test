# Use an official OpenJDK image
FROM openjdk:17-jdk-slim

# Set working directory to /server
WORKDIR /server

# Download the latest PaperMC jar file
RUN curl -o server.jar https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/499/downloads/paper-1.20.4-499.jar

# Accept Minecraft EULA
RUN echo "eula=true" > eula.txt

# Expose Minecraft's default port
EXPOSE 25565

# Run the PaperMC server with configurable memory
CMD ["java", "-Xmx16G", "-Xms1G", "-jar", "server.jar", "nogui"]
