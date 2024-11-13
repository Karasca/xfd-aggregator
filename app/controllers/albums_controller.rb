class AlbumsController < ApplicationController
  # before_action :authenticate_admin!

  def index
    @albums = Album.all
  end
  
  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to @album
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  private 
    def album_params
      params.require(:album).permit(:name, 
      genres_attributes: [:name], 
      events_attributes: [:name, :date,:location],
      crossfade_attributes: [:link],
      circle_attributes: [:name]
      )
    end
end
