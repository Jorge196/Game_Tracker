class GamesController < ApplicationController 

    get "/games" do 
        @games = Game.all
        erb :"/games/index.html"
    end 
end 