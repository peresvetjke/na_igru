class GameInfoNotificationSender < NotificationSender

  TYPES = [:game_cancelled, :game_confirmed]
   
  def initialize(game, players_to, message_type)
    @game = game
    @players_to = players_to
    @message_type = message_type
  end

  def message
    case @message_type
    when :game_cancelled
      "Game was cancelled."
    when :game_confirmed
      "Game was confirmed."
    end
  end

end