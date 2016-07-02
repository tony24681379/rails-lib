FROM debian:jessie

COPY sources.list /etc/apt
RUN apt-get update && apt-get install -y --no-install-recommends build-essential git vim ruby-dev libsqlite3-dev zlib1g-dev rails

#RUN useradd -ms /bin/bash rails
#RUN adduser rails sudo
#ENV HOME /home/rails

#USER rails
EXPOSE 3000
WORKDIR /rails-lib
