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

Elasticsearch Requirements
------

###### For development
```bash
$ wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
$ sudo apt-get install apt-transport-https
$ echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
$ sudo apt-get update && sudo apt-get install elasticsearch
```

Search for the initialization file of elasticsearch
 
```bash
 $ sudo nano /etc/elasticsearch/elasticsearch.yml
```
Change the line ``# network.host: 192.168.x.x`` to the uncommented ``network.host: 0.0.0.0``, then uncomment ``# http.port: 9200``

Restart the elasticsearch service

```bash
 $ sudo systemctl restart elasticsearch
```

Requires Java JDK-8 (min)

Important Dependencies
-------
* Mysql2
* For dev: Annotate, SearchKick
* For test: RSpec, Factory Bot, Faker, DatabaseCleaner, 
Shoulda Matchers, Rails Controllers Testing, Simple Coverage

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
Set environment variables on environment_variables.yml under the deployment key (watch environment_variables.example.yml) 
