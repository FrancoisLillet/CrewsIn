class Invitation < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User", optional: true
  belongs_to :trip

  validates :sender_id, presence: true
  validates :trip_id, presence: true
  validates :receiver_email, presence: true
  # , format: { with: /\A\w+@\w+\.+\w{1,4}\z/, message: "Please enter a valid email" }
end
