class Cafe < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :image, { presence: true }
  validates :name, { presence: true }
  validates :address, { presence: true }
  validates :number_seats, { presence: true }
end
