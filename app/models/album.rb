class Album < ApplicationRecord
    belongs_to :circle
    has_many :crossfade
    has_and_belongs_to_many :genres
    has_and_belongs_to_many :events
    accepts_nested_attributes_for :genres, :events, :crossfade, :circle


    # this disallows multiple genres of the same name to be added to the database by finding existing ones of the same name
    # for some reason the same idea doesn't work for the "Circle" belongs_to association and Active Record complains about the Circle not existing when trying to save.
    def genres_attributes=(genre_attributes)
        genre_attributes.values.each do | genre_attribute |
            genre = Genre.find_or_create_by(genre_attribute)
        end
    end

end