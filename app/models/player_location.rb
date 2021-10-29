class PlayerLocation < ApplicationRecord
  belongs_to :player
  belongs_to :location

  # validates :player, uniqueness

  
end
