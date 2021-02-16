FROM openjdk:11
RUN groupadd spring
RUN useradd -g spring spring
RUN apt-get update
RUN apt install -y maven vim tmux

RUN mkdir -p /home/spring/.m2 \
    && mkdir /home/spring/.m2/repository
COPY settings.xml /home/spring/.m2
#USER spring:spring
#COPY target/demo-0.0.1-SNAPSHOT.jar app/
#COPY pom.xml app/
#WORKDIR app

CMD ["java","-jar","/demo-0.0.1-SNAPSHOT.jar"]