class NotificationSender

  TYPES = [:new_player, :player_left, :invite_accepted, :invite_declined]

  def initialize(player_about, game, message_type, player_to)
    @player_about = player_about
    @game = game
    @player_to = player_to
    @message_type = message_type
  end

  def call
    @player_to.notifications.create!(body: message, game: @game)
  end

  def message
    m = case @message_type
    when :new_player
      "Player (#{@player_about.email}) joined the game!" # player amount ..
    when :player_left
      "Player (#{@player_about.email}) left the game!" # -1 ?
    when :invite_accepted
      "Player (#{@player_about.email}) accepted your invite!"
    when :invite_declined
      "Player (#{@player_about.email}) declined your invite!"
    end
    m << " Players amount: #{@game.game_players.count}"
  end

end