FROM daocloud.io/rabkool/node-server:latest

MAINTAINER rabkool<rabkool@i.softbank.jp>


# clone repo and install dependent
ENV NODE_ENV development
RUN cd /opt \
 && git clone https://github.com/rabkool/rabkool.github.io.git \
 && cd rabkool.github.io \
 && npm install \
 && chmod 755 /opt/rabkool.github.io/run


# build server
ENV NODE_ENV production
RUN cd /opt/rabkool.github.io \
 && npm run build:server

EXPOSE 8000

ENTRYPOINT /opt/rabkool.github.io/run
