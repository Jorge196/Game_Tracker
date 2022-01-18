source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', '>= 7.0.1', :require => 'active_record'
gem 'sinatra-activerecord', '>= 2.0.25', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'shotgun'
gem 'pry' 
gem 'bcrypt'
gem 'tux'
gem 'corneal', '~> 0.1.0'
gem 'sinatra-flash'
gem 'kill_shotgun'
gem 'bigdecimal', '1.3.5'
gem 'addressable', '2.8.0'
gem 'rack'
gem 'sqlite3'


group :development, :test do 
gem 'dotenv'
gem 'session_secret_generator'
gem 'sqlite3'

end 

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end

group :production do 
  gem 'pg'
end
