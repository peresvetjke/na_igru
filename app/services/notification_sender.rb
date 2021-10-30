class NotificationSender

  def initialize(game, players_to, message)
    @game = game
    @players_to = players_to
    @message = message
  end

  def call
    Array[@players_to].each { |player| inform_player(player)  }
  end

  def inform_player(player)
    player.notifications.create!(body: message, game: @game)
  end

  def message
    @message
  end

end