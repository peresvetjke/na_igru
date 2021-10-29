class NotificationSender

  def initialize(game, message_type = nil)
    @game = game
    @message_type = message_type
  end

  def call
  end

  def inform_player(player)
    player.notifications.create!(body: message, game: @game)
  end

  def message
  end

end