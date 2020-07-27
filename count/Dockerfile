
FROM ubuntu:18.04
MAINTAINER Keshav Thakur (keshav.thakur998@protonmail.com)

RUN apt update
RUN apt install sendemail -y
RUN apt install cron -y
RUN apt install libnet-ssleay-perl -y
RUN apt install libio-socket-ssl-perl -y
RUN apt install ca-certificates -y
RUN apt install gnupg -y
RUN echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" \
    | tee /etc/apt/sources.list.d/mongodb-org-4.0.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
    --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN apt update
RUN apt-get install mongodb-org-shell -y

COPY alert.sh /root/
COPY entrypoint.sh /root/

RUN chmod +x /root/alert.sh /root/entrypoint.sh

WORKDIR /root/

ENTRYPOINT /root/entrypoint.sh
