class Experience < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :country, presence: true
  validates :sailing_area, presence: true, length: { minimum: 3 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :role, presence: true
  validates :number_of_miles, presence: true, :numericality { only_integer: true }
  validates :boat_type, presence: true
  validates :boat_model, presence: true
  validates :boat_owner, presence: true
end
