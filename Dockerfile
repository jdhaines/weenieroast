# Dockerfile for weenie roast project
# Content used from sinkcup's mkdocs Dockerfile
# because I still suck at Docker...

# FROM nginx
# MAINTAINER Josh Haines <josh@joshhaines.com>

# COPY . /usr/share/nginx/weenieroast
# WORKDIR /usr/share/nginx/weenieroast

# # RUN apt-get update -qq
# # RUN apt-get upgrade -y
# RUN apt-get install -y python3-pip
# RUN pip3 install pipenv
# RUN pipenv install mkdocs mkdocs-material pymdown-extensions
# RUN pipenv run mkdocs build

# RUN cd /usr/share/nginx/

# RUN rm -f /etc/nginx/conf.d/*
# ADD nginx/conf.d /etc/nginx/conf.d/
# RUN sed -i "s|#gzip  on;|gzip  on; etag  off; server_tokens off; gzip_types *;|" /etc/nginx/nginx.conf

FROM python:3.7

WORKDIR /docs

RUN pip install mkdocs pymdown-extensions

EXPOSE 8180

CMD ["mkdocs", "serve"]