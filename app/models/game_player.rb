class GamePlayer < ApplicationRecord
  belongs_to :player
  belongs_to :game

  validates :player, uniqueness: { scope: :game, message: "can't be added more than once in one game" }

  after_destroy :after_destroy_send_notification # - 1
  after_create  :after_create_send_notification

  def after_destroy_send_notification
    NotificationSender.new(self.player, self.game, :player_left, self.game.organizator).call
  end

  def after_create_send_notification
    NotificationSender.new(self.player, self.game, :new_player, self.game.organizator).call
  end
end
