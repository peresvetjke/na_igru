class PlayerInfoNotificationSender

  TYPES = [:new_player, :player_left, :invite_accepted, :invite_declined, :game_cancelled, :game_approved]

  def initialize(game, message_type, player_to, player_about)
    @player_about = player_about
    @game = game
    @player_to = player_to
    @message_type = message_type
  end

  def call
    @player_to.notifications.create!(body: message, game: @game)
  end

  def message
    case @message_type
    when :new_player
      "Player (#{@player_about.email}) joined the game! Players amount: #{@game.game_players.count}" # player amount .. 
    when :player_left
      "Player (#{@player_about.email}) left the game! Players amount: #{@game.game_players.count}"
    when :invite_accepted
      "Player (#{@player_about.email}) accepted your invite! Players amount: #{@game.game_players.count}"
    when :invite_declined
      "Player (#{@player_about.email}) declined your invite! Players amount: #{@game.game_players.count}"
    end
  end

end