class YoutubeApiService
  CACHE_EXPIRY = 1.hours
  REQUEST = 'snippet'
  QUERY = '例大祭 XFD|クロスフェード'
  TYPE = 'video'
  MAX_RESULTS = 10
  ORDER = 'date'

  def self.fetch_data(pageToken)
    cache_key = "api_response:#{Digest::MD5.hexdigest("youtube.com/#{QUERY}/#{MAX_RESULTS}/#{pageToken}")}"
    # Check cache for cached data
    Rails.cache.fetch(cache_key, expires_in: 10.minutes) do
        # If not in cache, make the API call
        youtube = Google::Apis::YoutubeV3::YouTubeService.new
        youtube.key = Rails.application.credentials.dig(:google, :token)
        youtube.list_searches(REQUEST, q: QUERY , type: TYPE ,max_results: MAX_RESULTS, order: ORDER, page_token: pageToken)
    end
  end
end