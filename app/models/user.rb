class User < ApplicationRecord
  has_one_attached :photo, dependent: :destroy
  has_one_attached :license_recto, dependent: :destroy
  has_one_attached :license_verso, dependent: :destroy
  has_one_attached :passport_photo, dependent: :destroy
  has_one_attached :vhf_certificate, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :skipper_trips, class_name: "Trip", foreign_key: "skipper_id", dependent: :destroy
  has_many :created_trips, class_name: "Trip", foreign_key: "creator_id", dependent: :destroy
  has_many :invitations_sent, class_name: "Invitation", foreign_key: "sender_id", dependent: :destroy
  has_many :invitations_received, class_name: "Invitation", foreign_key: "receiver_id", dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :mates, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, length: { minimum: 2 }
end
