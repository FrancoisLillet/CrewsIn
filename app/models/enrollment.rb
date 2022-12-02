class Enrollment < ApplicationRecord
  belongs_to :mate
  belongs_to :trip

  validates :mate_id, presence: true
  validates :trip_id, presence: true
end
