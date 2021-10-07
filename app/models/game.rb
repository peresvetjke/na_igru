class Game < ApplicationRecord
  belongs_to :organizator, class_name: "Player", foreign_key: "organizator_id"
  belongs_to :location
  
  has_many :game_players
  has_many :players, through: :game_players
end
