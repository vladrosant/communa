class Organization < ApplicationRecord
  has_many :activities, dependent: :destroy

  validates :name, presence: true
  validates :location, presence: true
end
