class Invite < ApplicationRecord
  belongs_to :recepient, class_name: "Player", foreign_key: "recepient_id"
  belongs_to :game
  # belongs_to :sender ...
end