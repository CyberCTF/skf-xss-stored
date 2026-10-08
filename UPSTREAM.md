# Upstream

| | |
| --- | --- |
| Project | OWASP Security Knowledge Framework labs (SKF labs) |
| Repository | https://github.com/blabla1337/skf-labs |
| Lab | `java/xss-stored` (Java) |
| Version | master (SKF labs has no releases) |
| Commit | 35199b6f49658b75f860530c0f09b91e985198aa |
| Licence | Apache-2.0 |

| Here | SKF labs path |
| --- | --- |
| `build/web/app/` | [`java/xss-stored`](https://github.com/blabla1337/skf-labs/tree/35199b6f49658b75f860530c0f09b91e985198aa/java/xss-stored) |

The vendored folder is that commit's lab folder, unchanged, without its Git history.

`build/web/Dockerfile` is the lab's Dockerfile with `COPY ./` changed to `COPY app/`, and: the base image `openjdk:8-jdk-alpine`, removed from Docker Hub, becomes `eclipse-temurin:17.0.20.1_1-jdk-alpine-3.22`: a Java 8 JDK (Temurin 8u504) now fails the TLS handshake with Maven Central (`Received fatal alert: handshake_failure`), so the build uses JDK 17; the pom still targets Java 8 and Spring Boot 2.7 runs on 17.

To update, replace the vendored folder with a newer SKF labs commit, then change this file.
