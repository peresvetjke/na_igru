class GameInfoNotificationSender < NotificationSender

  TYPES = [:game_cancelled, :game_confirmed]
   
  def initialize(game, message_type)
    super(game, message_type)
  end

  def call
    @game.players_assigned.each { |player| inform_player(player) }
  end

  def message
    case @message_type
    when :game_cancelled
      "Game ##{@game.id} (#{@game.starting_time}, #{@game.location.title}) was cancelled."
    when :game_confirmed
      "Game ##{@game.id} (#{@game.starting_time}, #{@game.location.title}) was confirmed."
    end
  end

end