FROM ubuntu:latest

USER root
RUN useradd -ms /bin/bash user1
RUN usermod -aG sudo user1

# Install OpenJDK-11
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
RUN export JAVA_HOME


# USER user1
WORKDIR /home/user1/
COPY . .
RUN chmod -R 755 ./binarios/



ENTRYPOINT [ "./scripts/scanPipelineScan.sh" ]