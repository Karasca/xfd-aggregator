class EventsController < ApplicationController
    def autocomplete
        render json: Event.find_by(name: params[:name]).to_json
    end
end
