class LocationInfoNotificationSender  < NotificationSender

  def initialize(game)
    super(game)
  end

  def call
    Player.players_with_favorite_location(@game.location).each { |player| inform_player(player) }
  end

  def message
    "New game ##{@game.id} (#{@game.starting_time}, #{@game.location.title}) created on your favorite location."
  end

end