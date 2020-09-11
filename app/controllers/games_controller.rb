class GamesController < ApplicationController 

    get "/games" do #INDEX
        @games = Game.all
        erb :"/games/index.html"
    end 
end 