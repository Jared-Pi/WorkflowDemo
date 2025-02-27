FROM openjdk:17-jdk-slim

WORKDIR /app

COPY target/workflowdemo-1.0-SNAPSHOT.jar /app/workflowdemo.jar

ENTRYPOINT ["java", "-jar", "workflowdemo.jar"]