FROM maven:3.6.0-jdk-11-slim AS build

RUN mkdir -p /usr/app

RUN chown -R 1000 /usr/app

USER 1000

COPY src /usr/app/src

COPY pom.xml /usr/app

WORKDIR /usr/app

RUN mvn clean install -DskipTests

RUN file="$(ls -1 /usr/app)" && echo $file

RUN file="$(ls -1 /usr/app/target)" && echo $file

ARG JAR_FILE=/usr/app/target/*.jar

FROM adoptopenjdk/openjdk11:alpine

RUN echo ${JAR_FILE}

WORKDIR /usr/app

COPY --from=build ${JAR_FILE} /usr/app/app.jar

WORKDIR /usr/app

ENTRYPOINT ["java","-jar","./app.jar"]
