class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  # has_many :projects, dependent: :destroy
  # Validations
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :name, :email, :password_digest
  validates :name, length: { minimum: 4 }
  validates :password, length: { minimum: 4 }
end
