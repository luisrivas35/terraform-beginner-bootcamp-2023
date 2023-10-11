# Terraform Beginner Bootcamp 2023 - Week 2

## Working with Ruby

### Bundler
Package installer manager for Ruby (Gems)
#### Install Gems
Create a gem file for defining the gems on it 
```rb
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```
Then run the `bundle install` command. Install the gems globally(unlike NodeJs which do it in a folder called node_modules)
A Gemfile.lock is created to lock downs the gem versions used.
#### Executing scripts in the context of bundler
We use `bundle exec` to tell to future ruby scripts to use the gems installed.
#### Sinatra 
Is a micro-web framework for web-app in ruby. For mock or development servers. A web server in a single file
https://sinatrarb.com/
## Terratowns mock Server
### Running the web server
```
bundle install
bundle exec ruby server.rb
```
All the code for the server is in `server.rb` file

## CRUD
Terraform provider resources
https://en.wikipedia.org/wiki/Create,_read,_update_and_delete