module Api
    module V1
        class AlbumsController < ApiController
            def index
                @albums = Album.all
            end
        end
    end
end