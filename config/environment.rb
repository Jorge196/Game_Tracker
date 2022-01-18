ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

Dotenv.load

require './app/controllers/application_controller'
require_all 'app'

configure :production do 
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/game_tracker')

  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host => db.host,
    :username => db.username,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end 
