require_relative './save_data'
require_relative './musicalbum'
require_relative './genre'
require_relative './game'
require_relative './author'

class ListMusicAlbums
  def display
    data = SaveData.new
    music_album_list = data.read_from_file('./files/musicalbums.json')
    if music_album_list == 1
      puts 'No Music albums in the library'
    else
      music_album_list.each_with_index do |musicalbum, index|
        puts "(#{index + 1}) Publish Date: #{musicalbum['publish_date']}, On spotify: #{musicalbum['on_spotify']}"
      end
    end
  end
end

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

class ListGenres
  # rubocop:disable Metrics/PerceivedComplexity
  def display
    data = SaveData.new
    # List genres from books, games, and music albums
    music_album_list = data.read_from_file('./files/musicalbums.json')
    book_list = data.read_from_file('./files/books.json')
    game_list = data.read_from_file('./files/games.json')

    puts "\nMusic Genre[s]"
    puts '---------------'
    if music_album_list == 1
      puts 'No Music genres in the library. Please add a music album.'
    else
      puts music_album_list.map { |musicalbum| musicalbum['genre']['name'] }.uniq
    end
    # book genres
    puts "\nBook Genre[s]"
    puts '---------------'
    if book_list == 1
      puts 'No Book genres in the library.Please add a book item.'
    else
      puts book_list.map { |book| book['genre']['name'] }.uniq
    end
    # game genres
    puts "\nGame Genre[s]"
    puts '---------------'
    if game_list == 1
      puts 'No Book genres in the library. Please add a game item.'
    else
      puts game_list.map { |game| game['genre']['name'] }.uniq
    end
  end
  # rubocop:enable Metrics/PerceivedComplexity
end

class ListAuthors
  # rubocop:disable Metrics/PerceivedComplexity
  def display
    # Get all json file
    data = SaveData.new
    music_album_list = data.read_from_file('./files/musicalbums.json')
    book_list = data.read_from_file('./files/books.json')
    game_list = data.read_from_file('./files/games.json')

    puts '----'
    puts 'Games Author[s]'
    puts '----'
    if game_list == 1
      puts 'No Book genres in the library. Please add a game item.'
    else
      puts game_list.map { |author| author['author']['last_name'] }.uniq
      puts '------'
      puts "Author\'s Listed Successfully!"
      puts '------'
    end
    puts "\nMusic Author[s]"
    puts '---------------'
    if music_album_list == 1
      puts 'No Music labels in the library. Please add a music album.'
    else
      puts music_album_list.map { |musicalbum| musicalbum['author']['last_name'] }.uniq
    end
    puts "\nBook Author[s]"
    puts '---------------'
    if book_list == 1
      puts 'No Book labels in the library.Please add a book item.'
    else
      puts book_list.map { |book| book['author']['last_name'] }.uniq
    end
  end
  # rubocop:enable Metrics/PerceivedComplexity
end

def list_all_books
  data = SaveData.new
  books = data.read_from_file('./files/books.json')

  if books == 1
    puts 'No Book in the library'
  else
    books.each_with_index do |book, index|
      puts "(#{index + 1}) Book Name: #{book['label']['title']}, Author: #{book['author']['first_name']} #{book['author']['first_name']}"
    end
  end
  sleep 0.75
end

# rubocop:disable  Metrics//PerceivedComplexity
def list_all_labels
  data = SaveData.new
  music_album_list = data.read_from_file('./files/musicalbums.json')
  book_list = data.read_from_file('./files/books.json')
  game_list = data.read_from_file('./files/games.json')

  puts "\nMusic Labels"
  puts '---------------'
  if music_album_list == 1
    puts 'No Music labels in the library. Please add a music album.'
  else
    puts music_album_list.map { |musicalbum| musicalbum['label']['title'] }.uniq
  end

  puts "\nBook Labelss"
  puts '---------------'
  if book_list == 1
    puts 'No Book labels in the library.Please add a book item.'
  else
    puts book_list.map { |book| book['label']['title'] }.uniq
  end

  puts "\nGame Labels"
  puts '---------------'
  if game_list == 1
    puts 'No Book labels in the library. Please add a game item.'
  else
    puts game_list.map { |game| game['label']['title'] }.uniq
  end
end
# rubocop:enable  Metrics//PerceivedComplexity
