
# Springboot API Template
This project provides a ready-to-use Spring Boot API template designed to eliminate the need for starting from scratch when creating 
new Spring Boot applications. It includes a pre-configured Docker Compose setup to easily lift up essential services such as the 
database and the application container, streamlining development and deployment. The template ensures smooth integration with key
components like the database, allowing developers to focus more on building features rather than handling initial project setup.

## Keypoints:
- Template
- API
- Springboot
- Docker


## Run Locally

What you will need:
- Docker (running)

Clone the project

```bash
  git clone https://github.com/PotatoDoge/springboot-api-template.git
```

Go to project's directory

```bash
  cd springboot-api-template
```

Compile the project
```bash
  ./mvnw clean compile
```

Install the project
```bash
  ./mvnw clean install
```

Run the following commands:
```bash
    docker network create app-api-template
    docker volume create api-template-volume
    docker-compose build --no-cache
    docker-compose up -d
```
- This command will create containers for both the database and the api
- Once you add new features to the api, recompile and deploy again.
- 8084 and 5432 (or your own specified ports) must be free in order for this to run correctly
- In case that you decide to change the ports, double-check the application.yml to make sure
  that the same ports are being used

## Important configuration details
### application.yml
You will probably see this syntax: 
```yml
${db-username:postgres}
```
This is the meaning of that syntax
```yml
${value-from-docker-compose-file:default-fallback-value}
```
The next configuration sets the port and extends the base url
```yml
server:
  servlet:
    context-path: /api/v1
  port: 8084
```
Springboot's default port is 8080. This config sets the port to 8084,
and the base url to: ```http://host:8084/api/v1```
If you run your app locally, ```host``` is localhost. \
You can edit and remove both port and context-path configuration, and the app will
work fine with springboot's default values. 

### Dockerfile

```FROM openjdk:21``` must be the same java version used to compile the project.

```COPY ./target/springboot-api-template-1.0.0.jar app.jar```
What is between ```/target/``` and ```app.jar```
must be the same artifact name and version that is set in the pom.xml and the ones that 
were used to compile the project. 
### docker-compose.yml
You can modify the content of this file to fit your needs. 

## Authors

- [@PotatoDoge](https://github.com/PotatoDoge)


## Notes
Feel free to use the main branch or any of the existing branches for your own personal projects.
Also, feel free to contribute to this repository.

## Tags
- Springboot 3
- Java 21
- Docker