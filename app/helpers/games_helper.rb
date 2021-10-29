module GamesHelper

  def game_status(game)
    return "TBD" if game.confirmed.nil?
    game.confirmed ? "Confirmed" : "Cancelled"
  end

  def status_text_color(game)
    case game_status(game)
    when "TBD"
      "gray"
    when "Confirmed"
      "green"
    when "Cancelled"
      "red"
    end
  end
end