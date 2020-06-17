class SongsController < ApplicationController
  before_action :current_song
  skip_before_action :current_song, only: [:create, :new, :index]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    redirect_to song_path(@song)
  end

  def edit
  end

  def update
    @song.update(song_params)
    # byebug
    redirect_to @song
  end

  def show
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:name, :artist_id)
  end

  def current_song
    @song = Song.find(params[:id])
  end
end
