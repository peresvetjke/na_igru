# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |p|
  player = Player.new(email: "player#{p+1}@mail.ru", password: 'xxxxxx')
  player.save!
end

organizator = Player.first

3.times do |l|
  loc = Location.new(title: "Location#{l+1}")
  loc.save!

  5.times do |g|
    now = Time.now
    game = loc.games.new(organizator_id: organizator.id, starting_time: "#{now.year}#{now.month}#{now.day + g + 1} 21:00")
    game.save!

    6.times do |g_p|
      game.players.push(Player.find(g_p+1))
    end
  end
end