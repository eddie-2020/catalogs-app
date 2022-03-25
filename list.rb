require_relative './save_data'
require_relative './game'
require_relative './author'

class ListGames
  def display
    data = SaveData.new
    game_list = data.read_from_file('./files/games.json')
    if game_list.length.zero?
      puts 'There are no games in store for you...'
    else
      game_list.each_with_index do |game, index|
        # rubocop:disable Layout/LineLength
        puts "#{index + 1}. [Multiplayer]: #{game['multiplayer']}, [Last played at]: #{game['last_played_at']}, [Publish date]: #{game['publish_date']}"
        # rubocop:enable Layout/LineLength
      end
    end
  end
end

class ListAuthors
  def display
    data = SaveData.new
    # Get all json file
    author_list = data.read_from_file('./files/games.json')
    puts '----'
    puts 'Games Author[s]'
    puts '----'
    if author_list == 1
      puts 'No Book genres in the library. Please add a game item.'
    else
      puts(author_list.map { |author| author['author'] ['first_name'] })
      puts '------'
      puts "Author\'s Listed Successfully!"
      puts '------'
    end
  end
end
