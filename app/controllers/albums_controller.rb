class AlbumsController < ApplicationController
  before_action :authenticate_admin!, except: [ :index, :show ]

  def index
    # newest first
    @events = Event.all.order(date: :desc)
    if params[:eventIds]
      event_ids = params[:eventIds]
      @albums = Album.filter_by_event(event_ids).order(created_at: :desc)
    else
      @albums = Album.all.order(created_at: :desc)
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
    @events = Event.all
    @genres = Genre.all
    @circles = Circle.all


    @album.events.build
    @album.genres.build
    @album.crossfades.build
    @album.build_circle

    if params[:vId]
      @link = "https://youtube.com/watch?v=#{params[:vId]}"
    end

    if params[:vTitle]
      @videoTitle = params[:vTitle]
    end
  end

  def create
    @album = Album.new(album_params)


    if @album.save
      DiscordAlbumService.new(@album, url_for(@album)).call
      redirect_to root_path
    else
      @events = Event.all
      @genres = Genre.all
      puts "Error saving to album: "
      @album.errors.full_messages.each do | message |
      puts message
      end
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @album = Album.find(params[:id])
    @events = Event.all
    @genres = Genre.all
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to @album
    else
      @events = Event.all
      @genres = Genre.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    redirect_to root_path, status: :see_other
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
      params.require(:album).permit(
        :name, :folder, :circle_id, event_ids: [], genre_ids: [],
        circle_attributes: [ :id, :name ],
        crossfades_attributes: [ :id, :link, :_destroy ],
        events_attributes: [ :id, :name, :date, :location, :_destroy ],
        genres_attributes: [ :id, :name, :_destroy ],
      )
    end
end
