class Game < ApplicationRecord
  belongs_to :organizator, class_name: "Player", foreign_key: "organizator_id"
  belongs_to :location
  has_many :game_players, dependent: :destroy
  has_many :players_assigned, through: :game_players, source: :player
  has_many :invites

  accepts_nested_attributes_for :game_players
  
#  before_validation :before_validation_adjust_passed, on: :update

  scope :games_player_in, -> (player) { joins(:game_players).where('game_players.player_id = ?', player.id) }
  
  def cancel
    self.passed = false
    save
  end

  def pass
    self.passed = true
    save
  end

end
