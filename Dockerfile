FROM maven:3.6.0-jdk-11-slim AS build

RUN mkdir -p /usr/app

RUN chown -R 1000 /usr/app

USER 1000

COPY src /usr/app/src

COPY pom.xml /usr/app

WORKDIR /usr/app

RUN mvn clean package -DskipTests

FROM adoptopenjdk/openjdk11:alpine

COPY --from=build /usr/app/target/microservice-springboot-h2-0.0.1-SNAPSHOT.jar /usr/app/app.jar

ENTRYPOINT ["java","-jar","/usr/app/app.jar"]
