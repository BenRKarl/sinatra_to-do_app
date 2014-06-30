#Sinatra To-Do App

###This To-Do App is a demonstration for building a very basic web application using Sinatra. Below is a decent step-by-step that I often use for my own reference when beginning new Sinatra projects.

####In the beginning...

Assuming you have your repo set up and all the appropriate versions of ruby, here's the first few steps I normally take:

First thing is to get the database set up. This is done from the command line:

    `$ psql`
    `=# CREATE DATABASE sinatra_todo_app;` (Here I decided to call this database 'sinatra_todo_app.' Don't forget the semicolon at the end!)
    `=# \c sinatra_todo_app` (This takes you into the database)

Now that we're in the database, we'll want to set up the schema for our model. For this to-do app we'll only need one model, therefore only one table. You can write these commands one line at a time, or as one big line, just keep in mind that SQL will not acknowledge a command until you provide it with a semi-colon.

```
=# CREATE TABLE to_do
=# (
=# id serial4 PRIMARY KEY,
=# description varchar(255),
=# due_date varchar(255)
=# );
```

Now we have a database model for a to-do item that holds its unique id, description, and due date! You can verify that your commands worked by typing `\d` to see your tables. Notice the `id_seq` table that we didn't create? That keeps track of each entry's unique id so we never have to worry about duplicate rows.

Anyway, now we need an app to take advantage of this awesome new database. Here are my first steps for this:

1. `touch` the following files:
    * app.rb
    * config.rb
    * Gemfile

2. `mkdir` the following folders:
    * models
    * public
    * views

This is probably a good time to remind you that you can quit `psql` by typing `/q`. Now go back up and make sure to complete steps 1 & 2 and take a drink of water.

OK now open up that Gemfile and add in the below dependencies. Keep in mind that you can include any number of the millions of gems available at rubygems.org. For this app we should only need the below. If you're curious about what they do I encourage you to read up on their documentation.

```ruby
source 'https://rubygems.org'

gem 'sinatra'
gem 'sinatra-reloader'
gem 'pry'
gem 'pg'
gem 'sinatra-activerecord'
```

GO TO THE COMMAND LINE, TYPE `bundle` AND PRESS ENTER RIGHT NOW! It's a good habit to bundle your gems any time you touch your Gemfile. Notice that this process automatically puts a Gemfile.lock in your folder. No reason to ever touch this file as it keeps track of your application's dependencies and automatically updates anytime you bundle.

Now to the config.rb file:

```ruby
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'sinatra_todo_app'
)
```

