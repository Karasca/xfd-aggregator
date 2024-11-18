class AlbumsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    #newest first
    @albums = Album.all.order(created_at: :desc)
  end
  
  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
    if params[:vId]
      @link = "https://youtube.com/watch?v=#{params[:vId]}"
    end

    if params[:vTitle]
      @videoTitle = params[:vTitle]
    end
    
  end

  def create
    @album = Album.new(album_params)
    # can this be done easier with Active Record? I couldn't find anything
    @circle = Circle.find_or_create_by(name: params[:album][:circle_attributes][:name])
    @album.circle = @circle

    if @album.save
      DiscordAlbumService.new(@album, url_for(@album)).call
      redirect_to @album
    else
      puts "Error saving to album: "
      @album.errors.full_messages.each do | message |
      puts message
      end
      render :new, status: :unprocessable_entity
    end
    
  end

  def toggleFavorite
    @album = Album.find_by(id: params[:id])
    if @album
      @album.star = !@album.star
      if @album.save
        render json: @album.to_json
      end
    else
      render :index, status: :not_found
    end
  end

  private 
    def album_params
      params.require(:album).permit(:name, :folder,
      genres_attributes: [:name], 
      events_attributes: [:name, :date, :location],
      crossfades_attributes: [:link],
      circle_attributes: [:name]
      )
    end
end
