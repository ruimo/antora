FROM asciidoctor/docker-asciidoctor
LABEL MAINTAINER Shisei Hanai <ruimo.uno@gmail.com>

ENV ANTORA_VERSION 3.0

WORKDIR /root

RUN apk add nodejs npm && \
    ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    wget -O VLGothic.zip "http://osdn.jp/frs/redir.php?m=jaist&f=%2Fvlgothic%2F62375%2FVLGothic-20141206.zip" && \
    unzip VLGothic.zip && \
    mkdir -p /root/.fonts && \
    cp VLGothic/VL-Gothic-Regular.ttf /root/.fonts && \
    rm -rf /root/VLGothic* && \
    npm i -g @antora/cli@3.0 @antora/site-generator-default@3.0 @antora/site-generator@3.0 && \
    npm i -g phantomjs-prebuilt mermaid mermaid.cli
   
WORKDIR /documents