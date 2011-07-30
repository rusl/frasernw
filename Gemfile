source 'https://rubygems.org'

gem 'rails', '3.1.0rc5'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'
# gem 'rails',      :git => "git://github.com/rails/rails.git", :branch => "3-1-stable"


group :production do
  gem 'pg'
  gem 'therubyracer-heroku', '0.8.1.pre3'
end

# Asset template engines
gem 'sass-rails', "~> 3.1.0.rc"
gem 'coffee-script'
gem 'uglifier'

gem 'jquery-rails'
gem 'haml-rails'

gem 'authlogic'
gem 'carrierwave'

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
  # To use debugger
  #gem 'ruby-debug19', :require => 'ruby-debug'
  # guard for rspeccin
  # gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'guard-spork'
  gem 'growl'
end

# gem "mocha", :group => :test
# why bcrypt? I think it's for authlogic
gem "bcrypt-ruby", :require => "bcrypt"
