class Cafe < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :image, { presence: true }
  validates :name, { presence: true }
  validates :address, { presence: true }
  validates :number_seats, { presence: true }
end
