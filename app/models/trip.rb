class Trip < ApplicationRecord
  has_one_attached :photo
  has_one_attached :summary_file

  belongs_to :skipper, class_name: "User", optional: true
  belongs_to :creator, class_name: "User"
  has_many :enrollments, dependent: :destroy
  has_many :invitations
  has_many :mates, through: :enrollments

  validates :country, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :starting_point, presence: true
  validates :creator_id, presence: true
  validates :max_capacity, presence: true, numericality: { only_integer: true }
end
