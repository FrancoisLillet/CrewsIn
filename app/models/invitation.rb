class Invitation < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  belongs_to :trip

  validates :sender_id, presence: true
  validates :receiver_id, presence: true
  validates :trip_id, presence: true
end
