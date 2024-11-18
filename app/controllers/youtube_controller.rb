class YoutubeController < ApplicationController
    before_action :authenticate_admin!

    def index
        youtube = Google::Apis::YoutubeV3::YouTubeService.new
        youtube.key = Rails.application.credentials.dig(:google, :token)
        @response = youtube.list_searches('snippet', q:'例大祭21 XFD' , type:'video' ,max_results: 10)
        #render json: @response.to_json
    end

end
