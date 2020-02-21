class Project < ApplicationRecord
  has_many :tasks
  validates :name, presence: true, length: { maximum: 50 }
end
