source 'https://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'
# gem 'rails',      :git => "git://github.com/rails/rails.git", :branch => "3-1-stable"


group :production do
  gem 'pg'
  gem 'therubyracer-heroku', '0.8.1.pre3'
end

# Asset template engines
gem 'sass-rails', "~> 3.1.0"
gem 'coffee-script'
gem 'uglifier'

gem 'jquery-rails'
gem 'haml-rails'

gem 'authlogic'
gem 'carrierwave'
gem 'paper_trail', '~> 2'
gem 'will_paginate', '~> 3.0.0'
gem "simple_form", "~> 1.5.1"
gem "nested_form", :git => "https://github.com/ryanb/nested_form.git", :ref => "57f32788f1952bcd633057b4b56b69b51df17610"
gem 'exception_notification'

# Use unicorn as the web server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :test do
  gem 'faker'
  # Pretty printed test output
  gem 'turn', :require => false
end

group :development, :test do
  gem 'sqlite3'
  gem 'mocha'
  gem "nifty-generators"
  gem 'rspec'
  gem 'rspec-rails'
  gem 'wirble'
  gem 'spork', '> 0.9.0rc'
  # To use debugger
  gem 'ruby-debug19', :require => 'ruby-debug'
  # can't include rb-fsevent here as heroku doesn't like it
  # gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'guard-spork'
  gem 'growl'
  gem 'growl_notify'
  gem 'heroku'
  gem 'taps'
end

# gem "mocha", :group => :test
# why bcrypt? I think it's for authlogic
gem "bcrypt-ruby", :require => "bcrypt"
