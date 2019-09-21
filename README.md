# Readme / Quick Start

Version Requirements:

* Ruby 2.6.3
* Rails 5.2.3
* Database: SQLite


## Quick Start
* Install the above requirements, as well as dependencies.
```
bundle
```
* Create the DB, migrate, and seed with initial data:
```
rake db:create db:migrate db:seed
```
* Run the server!
```
rails s
```
* Go to localhost:3000


## Running Tests
* TODO - currently only testing very basic appointment creation
```
rails test
```
