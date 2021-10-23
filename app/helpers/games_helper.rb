module GamesHelper

  def status(game)
    return "upcoming" if game.passed.nil?
    game.passed ? "Passed" : "Cancelled"
  end

  def status_text_color(game)
    case status(game)
    when "upcoming"
      "gray"
    when "Passed"
      "green"
    when "Cancelled"
      "red"
    end
  end
end