
FROM nginx:1.19.0
MAINTAINER Keshav Thakur (keshav.thakur998@protonmail.com)

RUN apt update
RUN apt install apache2-utils -y
RUN apt install make -y
RUN apt install gcc -y
RUN apt install ruby -y
RUN apt install ruby-dev -y
RUN apt install libz-dev -y
RUN apt install build-essential -y
RUN gem install fluent
RUN gem install fluent-plugin-mongo

COPY .htpasswd /etc/apache2/
COPY index.html /usr/share/nginx/html/
COPY startup.sh /root/
COPY default.conf /etc/nginx/conf.d/
COPY fluentd.conf /root/

RUN chmod +x /root/startup.sh

WORKDIR /root/

EXPOSE 80

CMD /root/startup.sh