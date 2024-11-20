# README
A webapp for aggregating Touhou doujin event releases

## Ruby version

Ruby 3.3.5

## System dependencies

PostgreSQL
Redis

## Configuration

## Database creation

make sure to create a role(user) on postgresql with the name of this app `xfd_aggregator` with db creation privileges

set the password in database.yml to whatever password you gave it

run `rails db:create` after you created the user and rails will create the databases on the postgres server for you

# Database initialization

`rails db:migrate`

# How to run the test suite

# Services (job queues, cache servers, search engines, etc.)

redis-server

# Deployment instructions
