class Album < ApplicationRecord
    belongs_to :circle
    has_many :crossfades, dependent: :destroy
    has_and_belongs_to_many :genres
    has_and_belongs_to_many :events
    accepts_nested_attributes_for :events, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :genres, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :circle, reject_if: :all_blank
    accepts_nested_attributes_for :crossfades, reject_if: :all_blank, allow_destroy: true
    mount_uploader :folder, FolderUploader
    attribute :star, default: -> { false }
    scope :filter_by_event, ->(event_ids_arr) { joins(:events).where(events: { id: event_ids_arr }) }
    validates :name, presence: true
end
