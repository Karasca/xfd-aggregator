class Event < ApplicationRecord
    has_and_belongs_to_many :albums
    accepts_nested_attributes_for :albums
end
