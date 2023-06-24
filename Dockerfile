FROM openjdk:8
ARG PACKAGED_JAR=spring-boot-web-0.0.2-SNAPSHOT.jar

ADD ${PACKAGED_JAR} app.jar

ENTRYPOINT ["java","-Xmx2g","-jar","/app.jar"]
