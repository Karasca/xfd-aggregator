class Album < ApplicationRecord
    belongs_to :circle
    has_many :crossfades
    has_and_belongs_to_many :genres
    has_and_belongs_to_many :events
    accepts_nested_attributes_for :genres, :events, :crossfades, :circle
    mount_uploader :folder, FolderUploader
    attribute :star, default: -> { false }

    # Use existing record for association otherwise make new
    def genres_attributes=(genre_attributes)
        genre_attributes.values.each do | genre_attribute |
            genre = Genre.find_or_create_by(genre_attribute)
            self.genres << genre
        end
    end

    def events_attributes=(event_attributes)
        event_attributes.values.each do | event_attribute |
            event = Event.find_or_create_by(event_attribute)
            self.events << event
        end
    end

end