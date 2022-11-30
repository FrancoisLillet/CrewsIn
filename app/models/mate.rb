class Mate < ApplicationRecord
  belongs_to :user
  has_many :enrollments
  has_many :trips, through: :enrollments

  validates :user_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :address, presence: true
  validates :nationality, presence: true
  validates :country_of_residence, presence: true
  validates :passport_number, presence: true
  validates :expiration_date, presence: true
end
