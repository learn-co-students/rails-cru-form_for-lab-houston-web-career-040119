class SongsController < ApplicationController
    
    before_action :current_song, only: [:show,:edit,:update]
    
    def index
        @songs = Song.all
    end
    
    def new
        @song = Song.new
    end

    def show
    end    

    def edit
    end  
    
    def create
        @song = Song.create(song_params(:name,:artist_id,:genre_id))
        redirect_to @song
    end    
    
    def update
        @song.update(song_params(:name,:artist_id,:genre_id))
        redirect_to @song
    end    
    
    private
    
    
    def song_params(*arg)
        params.require(:song).permit(*arg)
    end
    
    def current_song
        @song = Song.find(params[:id])
    end
    
    
end
