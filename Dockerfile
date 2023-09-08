FROM ubuntu:focal

RUN apt-get -y update
RUN apt-get install -y curl git

RUN curl -s https://packagecloud.io/install/repositories/souffle-lang/souffle/script.deb.sh | bash
RUN apt-get install -y souffle=2.2

RUN git clone https://bitbucket.org/yanniss/doop.git /doop
COPY ./jdk-8u201-linux-x64.tar.gz /

RUN tar -zxvf /jdk-8u201-linux-x64.tar.gz -C /
ENV JAVA_HOME=/jdk1.8.0_201
ENV PATH=$PATH:$JAVA_HOME/bin
ENV CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar
ENV DOOP_HOME=/doop

WORKDIR /doop
