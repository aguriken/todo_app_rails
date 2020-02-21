class Task < ApplicationRecord
  belongs_to :project
  validates :name, presence: true, length: { maximum: 50 }
end
