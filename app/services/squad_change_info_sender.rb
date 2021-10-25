class SquadChangeInfoSender 
  TYPES = [:new_player, :player_left]

  def initialize(game_player, type, receiver)
    @game_player = game_player
    @receiver = receiver
    @type = type
  end

  def call
    @receiver.notifications.create!(body: message, game: @game_player.game)
  end

  def message
    case @type
    when :new_player
      "Player (#{@game_player.player.email}) joined the game! Players amount: #{@game_player.game.game_players.count}"
    when :player_left
      "Player (#{@game_player.player.email}) left the game! Players amount: #{@game_player.game.game_players.count - 1}"
    end
  end
end