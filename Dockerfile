# Dockerfile for weenie roast project
# Content used from sinkcup's mkdocs Dockerfile
# because I still suck at Docker...

FROM nginx
MAINTAINER Josh Haines <josh@joshhaines.com>

RUN apt-get update -qq
RUN apt-get upgrade -y
RUN apt-get install -y python-pip
RUN pip install pipenv
RUN pipenv install mkdocs mkdocs-material

RUN cd /usr/share/nginx/ && mkdocs new weenieroast

WORKDIR /usr/share/nginx/weenieroast

RUN pipenv run mkdocs build

RUN rm -f /etc/nginx/conf.d/*
ADD nginx/conf.d /etc/nginx/conf.d/
RUN sed -i "s|#gzip  on;|gzip  on; etag  off; server_tokens off; gzip_types *;|" /etc/nginx/nginx.conf
