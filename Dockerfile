FROM maven:3.8.4-openjdk-8-slim AS MAVEN_JAR

WORKDIR /code

COPY . .

RUN mvn package -DskipTests

FROM openjdk:8-jre-alpine

COPY --from=MAVEN_JAR code/target/*.war app.war

EXPOSE 9002

ENTRYPOINT ["java","-jar","app.war"]

LABEL org.opencontainers.image.source=https://github.com/vib5zemoso/packages-demo

