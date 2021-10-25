class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :confirmable, 
          :database_authenticatable, 
          :registerable,
          :recoverable, 
          :rememberable, 
          :validatable
  
  has_many :games_organized, class_name: "Game", foreign_key: "organizator_id"
  has_many :game_players
  has_many :games_played, through: :game_players, source: :game
  has_many :notifications, foreign_key: "recepient_id"
  has_many :invites_received, class_name: "Invite", foreign_key: "recepient_id"
  has_many :invites_sent, class_name: "Invite", foreign_key: "sender_id"

  scope :players_in_game, -> (game) {joins(:game_players).where('game_players.game_id = ?', game.id)}
  scope :players_not_in_game, -> (game) {where('id NOT IN (?)', players_in_game(game).pluck(:id))}

end
