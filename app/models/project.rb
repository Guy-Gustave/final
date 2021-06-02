class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy

  # validations
  validates_presence_of :title, :description
end
