class GamesController < ApplicationController 

    get "/games" do 
        @games = Game.all
        erb :"/games/index.html"
    end 

    get "/games/:id" do 
        @game = Game.find(params[:id])
        erb :"/games/show.html"
    end 

end 