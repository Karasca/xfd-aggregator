class YoutubeController < ApplicationController
    before_action :authenticate_admin!

    # moved to service
    # def index
    #     youtube = Google::Apis::YoutubeV3::YouTubeService.new
    #     youtube.key = Rails.application.credentials.dig(:google, :token)
    #     @response = youtube.list_searches('snippet', q:'例大祭 XFD|クロスフェード' , type:'video' ,max_results: 50, order: 'date')
    #     #render json: @response.to_json
    # end

    def index
        @response = YoutubeApiService.fetch_data
    end
end
