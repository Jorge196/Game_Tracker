require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true 
    set :session_secret, ENV["SESSION_SECRET"]
    set :method_override, true 
    register Sinatra::Flash 
  end

  get "/" do
    erb :welcome
  end

  get '/login' do
    erb :'/sessions/login'
  end 

  private 

  post '/login' do 
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
        session[:id] = user.id
        redirect "/"
    else 
        @error = "Incorrect email or password"
        erb :'/sessions/login'
    end 
  end 

  delete 'logout' do 
    session.clear 
    redirect "/"
end 


  def current_user
    User.find_by_id(session[:id])
  end 

  def logged_in?
    !!current_user
  end 

  def redirect_if_not_logged_in
    if !logged_in?
      flash[:error] = "You must be logged in to view that page"
      redirect request.referrer || "/login"
    end 
  end 

end
