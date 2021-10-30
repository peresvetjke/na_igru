class PlayerInfoNotificationSender  < NotificationSender

  TYPES = [:new_player, :player_left, :invite_accepted, :invite_declined]

  def initialize(game, players_to, message_type, player_about)
    @game = game
    @players_to = players_to
    @message_type = message_type
    @player_about = player_about
  end

  def message
    msg = case @message_type
    when :new_player
      "Player (#{@player_about.email}) joined the game!"
    when :player_left
      "Player (#{@player_about.email}) left the game!"
    when :invite_accepted
      "Player (#{@player_about.email}) accepted your invite!"
    when :invite_declined
      "Player (#{@player_about.email}) declined your invite!"
    end
    msg << " Players amount: #{@game.game_players.count}"
  end

end