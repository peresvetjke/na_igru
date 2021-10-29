class LocationInfoNotificationSender

  TYPES = [:game_created ]
   
  def initialize(game, message_type)
    @game = game
    @message_type = message_type
  end

  def call
    Player.players_with_favorite_location(@game.location).each { |player| player.notifications.create!(body: message, game: @game) }
  end

  def message
    case @message_type
    when :game_created
      "New game ##{@game.id} (#{@game.starting_time}, #{@game.location.title}) created on your favorite location."
    end
  end

end