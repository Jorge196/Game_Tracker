
class GamesController < ApplicationController 

    get "/games" do 
        @games = Game.where(["user_id = ?", current_user.id]).all
        erb :"/games/index.html"
    end 

    get "/games/new" do 
        redirect_if_not_logged_in
        @game = Game.new
        erb :'/games/new.html'
    end 

    get "/games/deleted" do 
        redirect_if_not_logged_in
        erb :'/games/deleted.html'
    end

    post "/games" do 
        redirect_if_not_logged_in
        @game = current_user.games.build(title: params[:game][:title], genre: params[:game][:genre], release_year: params[:game][:release_year])
        if  @game.save
            redirect "/games"
        else 
            erb :'/games/new.html'
        end 
    end 


    get "/games/:id" do 
        set_game
        erb :"/games/show.html"
    end 


    get "/games/:id/edit" do 
        set_game 
        redirect_if_not_authorized
        erb :'/games/edit.html'
    end 

    patch "/games/:id" do
        set_game 
        redirect_if_not_authorized
        if @game.update(title: params[:game][:title], genre: params[:game][:genre], release_year: params[:game][:release_year])
            redirect "/games/#{@game.id}"
        else
            erb :"/games/edit.html"
        end
    end 

    delete "/games/:id" do
        set_game
        redirect_if_not_authorized
        @game.destroy
        redirect "/games/deleted"
    end 

    def set_game
        @game = Game.find_by_id(params[:id])
        if @game.nil?
            flash[:error] = "Unable to find a Game with id: #{params[:id]}"
            redirect "/games"
        end 
    end 

    def redirect_if_not_authorized
        redirect_if_not_logged_in
        if !authorize_game(@game)
          flash[:error] = "Sorry, you're unable to perform this action."
          redirect "/games"
        end
    end 
    
    def authorize_game(game)
        current_user == game.user
    end 
end 