FROM openjdk:17-jdk-alpine
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
COPY target/helloworld-1.0-SNAPSHOT.jar helloworldwar.jar
EXPOSE 3000
ENTRYPOINT exec java $JAVA_OPTS -jar helloworldwar.jar
# For Spring-Boot project, use the entrypoint below to reduce Tomcat startup time.
#ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar helloworldwar.jar
