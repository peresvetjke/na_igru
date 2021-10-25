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
  has_many :invites, foreign_key: "recepient_id"            
end
