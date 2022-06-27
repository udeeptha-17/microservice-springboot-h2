FROM adoptopenjdk/openjdk11:alpine

RUN mkdir -p /usr/app

RUN chown -R 1000 /usr/app

USER 1000

ARG JAR_FILE=./target/*.jar

COPY ${JAR_FILE} /usr/app/app.jar

WORKDIR /usr/app

ENTRYPOINT ["java","-jar","./app.jar"]
