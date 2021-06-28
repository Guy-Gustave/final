class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  # belongs_to :user

  # validations
  # validates :title, uniqueness: true
  validates_presence_of :title, :description
end
