class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :skipper_trips, class_name: "Trip", foreign_key: "skipper_id"
  has_many :created_trips, class_name: "Trip", foreign_key: "creator_id"
  has_many :invitations_sent, class_name: "Invitation", foreign_key: "sender_id"
  has_many :invitations_received, class_name: "Invitation", foreign_key: "receiver_id"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
