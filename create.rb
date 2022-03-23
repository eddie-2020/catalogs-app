require './main'

class CreateCatalogs
  def initialize(games)
    @games = games
  end
end

class AddGames < CreateCatalogs
  def add_game
    print "\nEnter multiplayer: "
    multiplayer = gets.chomp

    print "\nEnter the last played date in this format [YYYY-MM-DD]: "
    last_played_at = gets.chomp

    print "\nEnter the published date in this format [YYYY-MM-DD]: "
    publish_date = gets.chomp.to_s

    @games << Game.new(multiplayer, last_played_at, publish_date)
    puts "\nGame added successfully!"
  end
end
