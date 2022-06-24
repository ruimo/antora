FROM asciidoctor/docker-asciidoctor
LABEL MAINTAINER Shisei Hanai <ruimo.uno@gmail.com>

ENV COMPASS_VERSION 1.0.3
ENV ZURB_FOUNDATION_VERSION 4.3.2
ENV FFI_VERSION 1.15.5
ENV ANTORA_VERSION 2.3

WORKDIR /root

RUN apk add g++ make ruby-dev libffi-dev nodejs npm ca-certificates openssl && \
    gem install --version ${FFI_VERSION} ffi -N && \
    gem install --version ${COMPASS_VERSION} compass -N && \
    gem install --version ${ZURB_FOUNDATION_VERSION} zurb-foundation -N && \
    ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    rm -rf /tmp/* /var/tmp/* && \
    wget -O VLGothic.zip "http://osdn.jp/frs/redir.php?m=jaist&f=%2Fvlgothic%2F62375%2FVLGothic-20141206.zip" && \
    unzip VLGothic.zip && \
    mkdir -p /root/.fonts && \
    cp VLGothic/VL-Gothic-Regular.ttf /root/.fonts && \
    rm -rf /root/VLGothic* && \
    wget https://github.com/asciidoctor/asciidoctor-stylesheet-factory/archive/master.zip && \
    unzip master.zip && \
    cd asciidoctor-stylesheet-factory-main && \
    compass compile && \
    cp -pr stylesheets / && \
    cd .. && \
    rm -rf master.zip asciidoctor-stylesheet-factory-main && \
    npm i -g @antora/cli@${ANTORA_VERSION} @antora/site-generator-default@${ANTORA_VERSION}
   
WORKDIR /documents