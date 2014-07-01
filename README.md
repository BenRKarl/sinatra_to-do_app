#Sinatra To-Do App

###This To-Do App is a demonstration of a very basic web application built with Sinatra, Active Record, and PostgreSQL. Here are the basic steps to get started with Sinatra.

####In the beginning...

First thing is to get the database set up. This is done from the command line:

```
$ psql
=# CREATE DATABASE sinatra_todo_app;
=# \c sinatra_todo_app
```

This creates a database that I've chosen to call 'sinatra_todo_app,' then takes you into the database where you can create a schema. Since this is a basic app I'll stick with just one model.

```
=# CREATE TABLE to_dos
=# (
=# id serial4 PRIMARY KEY,
=# description varchar(255),
=# due_date varchar(255)
=# );
```

One cool thing about SQL is you can write commands on separate lines to make is easier to read. It doesn't actually execute anything until you give it a semi-colon. Also good to make your table name plural as Active Record will make that assumption.

Now let's move on to the application itself:

1. `touch` the following files:
    * app.rb
    * config.rb
    * Gemfile

2. `mkdir` the following folders:
    * models
    * public
    * views

Open up that Gemfile and add in the below dependencies. Again, since this is a basic app, we don't have many depenencies.

```ruby
source 'https://rubygems.org'

gem 'sinatra'
gem 'sinatra-reloader'
gem 'pry'
gem 'pg'
gem 'sinatra-activerecord'
```

Since we've edited the Gemfile it's important to run `bundle` command line, which will update our dependencies and update and/or create the Gemfile.lock file.

Now to the config.rb file:

```ruby
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'sinatra_todo_app'
)
```

Here we've set up the connection Active Record needs to talk to the database we created earlier.

Now that we've gone through the set up phase it's time to start creating the application itself. Since this stage is more involved I won't catalogue each step. One thing to make note of is that I did not create a show action or view because the index assumes this role.
