class GamesController < ApplicationController 

    get "/games" do 
        @games = Game.all
        erb :"/games/index.html"
    end 

    get "/games/new" do 
        redirect_if_not_logged_in
        @game = Game.new
        erb :'/games/new.html'
    end 

    post "/games" do 
        redirect_if_not_logged_in 
        @game = current_user.games.build(title: params[:game][:title], content: params[:game][:content])
        if @game.save 
            redirect "/games"
        else 
            erb :'/games/new.html'
        end 
    end 


    get "/games/:id" do 
        @game= Game.find_by_id(params[:id])
        erb :"/games/show.html"
    end 

    get "/games/:id/edit" do 

    end 

    patch "/games/:id" do

    end 

    delete "/posts/:id" do 

    end 

    
end 