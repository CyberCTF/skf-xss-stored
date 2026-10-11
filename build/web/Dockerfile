# Overlay of SKF labs' java/xss-stored/Dockerfile (vendored unchanged in app/). Differences:
# - COPY src/ and pom.xml read from app/ (the vendored lab sits in app/ of this build folder);
# - the base image openjdk:8-jdk-alpine, removed from Docker Hub, becomes
#   eclipse-temurin:17.0.20.1_1-jdk-alpine-3.22. A Java 8 JDK (Temurin 8u504) fails the TLS
#   handshake with Maven Central (handshake_failure), so the build uses JDK 17; the pom still
#   compiles for Java 8 and Spring Boot 2.7 runs on 17.
# - it creates /ctf owned by the lab user, for the per-player flag.

### STATIC LAYER
FROM eclipse-temurin:17.0.20.1_1-jdk-alpine-3.22 as builder
LABEL MAINTAINER="Glenn ten Cate <glenn.ten.cate@owasp.org>"

RUN  apk add maven

### DYNAMIC LAYER
FROM builder
COPY app/src/ /skf/src/
COPY app/pom.xml /skf/

### CREATING LIMITED USER AND CHAING WORKDIR FOLDER OWNERSHIP
RUN addgroup -S spring && adduser -S spring -G spring && chown -R spring:spring /skf

### SWITCHING TO THE LIMITED USER
# Overlay: the flag folder /ctf, owned by the lab user so the flag init (which runs as that user) can write it.
RUN mkdir -p /ctf && chown spring:spring /ctf

USER spring:spring
WORKDIR /skf
RUN mvn package -Dmaven.test.skip=true

ENTRYPOINT ["java","-jar","/skf/target/app.jar"]
