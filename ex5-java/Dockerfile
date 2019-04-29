FROM openjdk:11.0.3-jdk-stretch

WORKDIR /app

COPY Main.java /app

RUN javac Main.java

CMD [ "Main" ]

ENTRYPOINT [ "java" ]