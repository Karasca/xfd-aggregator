# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
Ruby 3.3.5

* System dependencies
- PostgreSQL

* Configuration

* Database creation
make sure to create a role(user) on postgresql with the name of this app `xfd_aggregator` with db creation privileges
set the password in database.yml to whatever password you gave it
run `rails db:create` after you created the user and rails will create the databases on the postgres server for you
* Database initialization
`rails db:migrate`

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)
discord_bot.rb 

* Deployment instructions
