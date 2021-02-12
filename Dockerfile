FROM openjdk:11
RUN groupadd spring
RUN useradd -g spring spring
RUN apt-get update
RUN apt install -y maven vim tmux

USER spring:spring
VOLUME /tmp
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app

CMD ["java","-cp","app:app/lib/*","hello.Application"]