FROM openjdk:21
ARG JAR_FILE=target/*.jar
COPY ./target/springboot-api-template-1.0.0.jar app.jar
ENTRYPOINT ["java", "-jar","app.jar"]