class Activity < ApplicationRecord
  belongs_to :organization
  belongs_to :activity_type

  validates :title, presence: true
  validates :date, presence: true
  validates :people_impacted, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :hours, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
end
