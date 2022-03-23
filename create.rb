class CreateCatalog
  def add_game
    puts 'Enter multiplayer: '
    multiplayer = get.chomp

    puts 'Enter the last played date in this format [YYYY-MM-DD]: '
    last_played_at = gets.chomp

    puts 'Enter the published date in this format [YYYY-MM-DD]: '
    publish_date = gets.chomp

    @games << Game.new(multiplayer, last_played_at, publish_date)
    puts 'Game added successfully!'
  end
end
