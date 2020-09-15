class GamesController < ApplicationController 

    get "/games" do 
        @games = Game.all
        erb :"/games/index.html"
    end 

    get "/games/new" do 

    end 

    post "/games" do 

    end 

    get "/games/:id" do 
        @game = Game.find(params[:id])
        erb :"/games/show.html"
    end 

    get "/games/:id/edit" do 

    end 

    patch "/games/:id" do

    end 

    delete "/posts/:id" do 
        
    end 

    
end 