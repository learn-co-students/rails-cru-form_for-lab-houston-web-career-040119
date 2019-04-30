class GenresController < ApplicationController
  before_action :current_genre
  skip_before_action :current_genre, only: [:create, :new, :index]

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(genre_params)
    redirect_to genre_path(@genre)
  end

  def edit
  end

  def update
    @genre.update(genre_params)
    # byebug
    redirect_to @genre
  end

  def show
  end

  def destroy
    @genre.destroy
    redirect_to genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def current_genre
    @genre = Genre.find(params[:id])
  end
end
