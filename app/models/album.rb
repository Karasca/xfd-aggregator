class Album < ApplicationRecord
    belongs_to :circle
    has_many :crossfade
    has_and_belongs_to_many :genres
    has_and_belongs_to_many :events
    accepts_nested_attributes_for :genres, :events, :crossfade, :circle

    def genres_attributes=(genre_attributes)
        genre_attributes.values.each do | genre_attribute |
            # SQL INJECTION RISK!!
            genre = Genre.find_or_create_by(genre_attribute)
        end
    end

    def circle_attributes=(circle_attributes)
        circle_attributes.values.each do | circle_attribute |
            # SQL INJECTION RISK!!
            circle = Circle.find_or_create_by(circle_attribute)
        end
    end


end