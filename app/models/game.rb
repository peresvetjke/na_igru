class Game < ApplicationRecord
  belongs_to :organizator, class_name: "Player", foreign_key: "organizator_id"
  belongs_to :location
  
  has_many :game_players, dependent: :destroy
  has_many :players_assigned, through: :game_players, source: :player
end
