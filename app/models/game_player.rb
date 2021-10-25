class GamePlayer < ApplicationRecord
  belongs_to :player
  belongs_to :game

  validates :player, uniqueness: { scope: :game, message: "can't be added more than once in one game" }

  before_destroy :before_destroy_send_notification
  after_create   :after_create_send_notification

  def before_destroy_send_notification
    SquadChangeInfoSender.new(self, :player_left, self.game.organizator).call
  end

  def after_create_send_notification
    SquadChangeInfoSender.new(self, :new_player, self.game.organizator).call
  end
end
