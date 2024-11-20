class YoutubeController < ApplicationController
    before_action :authenticate_admin!

    def index
        @crossfades = Crossfade.all
        @response = YoutubeApiService.fetch_data
    end
end
