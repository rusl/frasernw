source 'http://rubygems.org'

gem 'rails', '3.1.0.rc1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

# Asset template engines
gem 'sass'
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
  # gem 'mocha'
  gem "nifty-generators"
  gem 'rspec'
  gem 'rspec-rails'
  gem 'wirble'
  # To use debugger
  gem 'ruby-debug19', :require => 'ruby-debug'
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
