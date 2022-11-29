class Enrollment < ApplicationRecord
  belongs_to :mate
  belongs_to :trip
end
