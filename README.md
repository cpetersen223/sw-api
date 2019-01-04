SW API
========

Ruby version
-----

```bash
ruby 2.4.4
```

Rails version
-----

```bash
rails 2.5.2
```

Database version tested
-------
Mysql ver 14.14 Dist 5.7.24 for Linux (x86_64) using EditLine wrapper

Important Dependencies
-------
* Mysql2
* For dev: Annotate
* For test: RSpec, Factory Bot, Faker, DatabaseCleaner, 
Shoulda Matchers, Rails Controllers Testing

Development
-------
First create an environment_variables.yml file

```bash
mv environment_variables.example.yml environment_variables.yml
```
Then, substitute all the values of the variables

Install dependencies
```bash
bundle install
```

Setup the database
```bash
bundle exec rails db:create db:migrate db:seed
```

Init the server
```bash
bundle exec rails s
```

Running tests
-------

```bash
bundle exec rspec
```

Deployment instructions
-------
Todo...
