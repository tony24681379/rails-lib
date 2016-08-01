FROM debian:jessie

COPY sources.list /etc/apt
RUN apt-get update && apt-get install -y --no-install-recommends build-essential git vim ruby-dev libsqlite3-dev zlib1g-dev rails libmysqlclient-dev && apt-get autoclean && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/tony24681379/rails-lib && cd /rails-lib && bundle && rake db:migrate

EXPOSE 3000
WORKDIR /rails-lib
#CMD ["rails","s"]

#docker run -it -p 3000:3000 --name rails-server -v $(pwd):/rails-lib rails-lib bash