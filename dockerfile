FROM ubuntu:20.04

RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -yq --no-install-recommends \
    libssl-dev \
    git \
    libsndfile1-dev \
    libwebkit2gtk-4.0-dev \
    libasound2-dev \
    curl \
    ca-certificates \
    unzip
RUN apt clean

RUN mkdir /music

RUN useradd -ms /bin/bash onetagger
USER onetagger
WORKDIR /home/onetagger

RUN curl -L -o onetagger.zip https://1t.marekkon5.workers.dev/artifact/latest/onetagger-linux
RUN unzip onetagger.zip
RUN tar zxvf OneTagger-linux.tar.gz
RUN rm *.zip *.tar.gz

CMD ./onetagger --server --expose