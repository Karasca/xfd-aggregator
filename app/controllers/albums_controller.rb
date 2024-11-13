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
    # can this be done easier with Active Record? I couldn't find anything
    @circle = Circle.find_or_create_by(name: params[:album][:circle_attributes][:name])
    @album.circle = @circle    

    if @album.save
      redirect_to @album
    else
      puts "Error saving to album: "
      @album.errors.full_messages.each do | message |
      puts message
      end
      render :new, status: :unprocessable_entity
    end
    
  end

  private 
    def album_params
      params.require(:album).permit(:name, 
      genres_attributes: [:name], 
      events_attributes: [:name, :date, :location],
      crossfade_attributes: [:link],
      circle_attributes: [:name]
      )
    end
end
