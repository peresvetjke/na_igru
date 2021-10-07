class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :confirmable, 
          :database_authenticatable, 
          :registerable,
          :recoverable, 
          :rememberable, 
          :validatable
  
  has_many :games, foreign_key: "organizator_id"
  # has_many :game_players        
  # has_many :games, through: :game_players

end
