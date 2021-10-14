class Cafe < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments
  belongs_to :user
  has_one_attached :image
  mount_uploader :image, ImageUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :image, { presence: true }
  validates :name, { presence: true }
  validates :address, { presence: true }
  validates :number_seats, { presence: true }
end
