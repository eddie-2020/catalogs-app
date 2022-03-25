require_relative './game'
require_relative './item'
require_relative './save_data'
require_relative './author'
require_relative './to_hash'

class CreateGames
  # rubocop:disable Metrics/MethodLength
  def create
    data = SaveData.new
    to_hash = ToHash.new

    # Get multiplayer
    print "\nEnter multiplayer: "
    multiplayer = gets.chomp

    # Get last played at
    print "\nEnter last played at [YYYY/MM/DD]: "
    last_played_at = gets.chomp

    # Get publish date
    print "\nEnter publish date [YYYY/MM/DD]: "
    publish_date = gets.chomp

    # Get author's details
    puts '----'
    puts 'Who created the game?'
    puts '----'
    print "[Author\'s First Name]: "
    first_name = gets.chomp
    print "\n[Author\'s Last Name]: "
    last_name = gets.chomp

    # Get game label
    puts '----'
    puts "What is the game\'s title and type?"
    puts '----'
    print "[Enter Game\'s title]: "
    title = gets.chomp

    # rubocop:disable Lint/UselessAssignment
    print "\n[Enter Game\'s type] (Adventure, Action, Racing...): "
    type_of_game = gets.chomp
    # rubocop:enable Lint/UselessAssignment

    # Check if game is archive
    puts '----'
    puts 'Is game archive?'
    puts '----'

    print 'Archive? [y/n]: '
    can_be_archived = gets.chomp.downcase
    # rubocop:disable Lint/UselessAssignment
    case can_be_archived
    when 'y' || 'Y'
      archived = true
    else
      archived = false
      puts "\n[INVALID]: Not archived yet..."
    end
    # rubocop:enable Lint/UselessAssignment

    # Get author class attributes
    author = Author.new(first_name, last_name)

    # Get game class attributes

    game = Game.new(multiplayer, last_played_at, publish_date)

    author.add_item(game)

    # Save game in hash format
    game_hash = to_hash.to_hash(game)

    # Save data in game.json
    data.write_to_file('./files/games.json', game_hash)
    puts "\n#{title} game was created successfully!"
  end
  # rubocop:enable Metrics/MethodLength
end
