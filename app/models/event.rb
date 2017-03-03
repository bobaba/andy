class Event < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  validates :name, presence: true, length: {maximum: 47}
  validates :location, length: {maximum: 60}
  validates :start_time, :end_time, presence: true

  mount_uploader :poster, PictureUploader
end
