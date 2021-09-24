class User < ApplicationRecord
  has_secure_password
  has_many :caves, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, { presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false } }

  VALID_PASSWORD_REGEX = /\A[\w\-]+\z/.freeze
  validates :password, { presence: true, length: { minimum: 8 }, format: { with: VALID_PASSWORD_REGEX }, allow_nil: true }

  validates :password_confirmation, presence: true
end
