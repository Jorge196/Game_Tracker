class UsersController < ApplicationController
    

    get '/users/new' do
         
        erb :'/user/new'
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

    