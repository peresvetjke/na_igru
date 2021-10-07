class GamePlayer < ApplicationRecord
  belongs_to :player
  belongs_to :game

  validates :player, uniqueness: { scope: :game, message: "can't be added more than once in one game" }
end
