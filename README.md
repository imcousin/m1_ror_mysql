# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



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
