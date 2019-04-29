class GenresController < ApplicationController
    
    before_action  :current_genre, only: [:show,:edit,:update]
 
    
    def new
        @genre = Genre.new
    end
    
    def show
    end
    
    def edit
    end


    def create
       @genre = Genre.create(genre_params(:name))
       redirect_to @genre
    end

    def update
        @genre.update(genre_params(:name))
        redirect_to @genre
    end
    
    
    
    
    
    private
    
    def genre_params(*arg)
        params.require(:genre).permit(*arg)
    end
    
    def current_genre
        @genre = Genre.find(params[:id])
    end 
    
    # def current_corgi
    #     @corgi = Corgi.find(params[:id])
    # end
end
