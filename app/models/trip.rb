class Trip < ApplicationRecord
  belongs_to :skipper, class_name: "User"
  belongs_to :creator, class_name: "User"
end
