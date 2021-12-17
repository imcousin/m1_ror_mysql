# syntax=docker/dockerfile:1
FROM ruby:2.7.5
RUN apt-get update && apt-get install -y  \
        curl \
        build-essential \
        libpq-dev && \
        curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
        curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
        echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
        apt-get update && apt-get install -y build-essential libpq-dev nodejs yarn && \
        rm -rf /var/lib/apt/lists/*

WORKDIR /myapp

RUN yarn install

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]



## Create rails app files
# docker-compose run --no-deps web rails new . --force --database=mysql

# Connect the db in config/database.yml
# default: &default
  # username: root
  # password: 
  # host: db

## Build the image
# docker compose build

## Create db after docker compose up db
# docker-compose run web rake db:create