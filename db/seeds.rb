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

location1 = Location.create!(title: "ВЛКСМ", lng: '37.85257389735338', lat: "56.00034562150262", region: "Pushkinsky District", district: "Pushkino", place: "141206")
location2 = Location.create!(title: "Стадион Труд", lng: "37.901350894736964", lat: "55.98045849213358", region: "Moscow", district: "Ivanteyevka", place: "141280")
location3 = Location.create!(title: "Стадион Вымпел", lng: "37.82582948295513", lat: "55.91590595437674", region: "Moscow", district: "Korolev", place: "141070")

Location.all.each do |l|

  5.times do |g|
    now = Time.now
    game = l.games.new(organizator_id: organizator.id, starting_time: "#{now.year}#{now.month}#{now.day + g + 1} 21:00")
    game.save!

    6.times do |g_p|
      game.players_assigned.push(Player.find(g_p+1))
    end
  end
end



#{}"lng"=>, "lat"=>, "region"=>, "district"=>, "place"=>


# "lng"=>"", "lat"=>, "region"=>, "district"=>, "place"=>