class UsersController < ApplicationController
    set :views. 'app/views/users'

    get '/users/new' do
         
        erb :new
    end 

    post '/users' do 
        @user = User.new(email: params[:email], password: params[:password])
        if @user.save 
            session[:id] = @user.id 
            redirect "/" 
        else 
            erb :'/user/new'
        end 
    end 
end 

    