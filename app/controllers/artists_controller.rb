class ArtistsController < ApplicationController
  before_action :current_artist
  skip_before_action :current_artist, only: [:create, :new, :index]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    redirect_to artist_path(@artist)
  end

  def edit
  end

  def update
    @artist.update(artist_params)
    # byebug
    redirect_to @artist
  end

  def show
  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :bio)
  end

  def current_artist
    @artist = Artist.find(params[:id])
  end
end
