class Album < ApplicationRecord
    belongs_to :circle
    has_many :crossfade
    has_and_belongs_to_many :genres
    has_and_belongs_to_many :events
    accepts_nested_attributes_for :genres, :events, :crossfade, :circle
end
