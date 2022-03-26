require 'date'
require_relative './game'
require_relative './musicalbum'
require_relative './create'
require_relative './list'

class App
  def run
    check_files

    @create_album = CreateMusicAlbum.new
    @create_game = CreateGames.new
    @list_albums = ListMusicAlbums.new
    @list_genres = ListGenres.new
    @list_games = ListGames.new
    @list_authors = ListAuthors.new

    puts 'Welcome to Catalog of Things!'
    loop do
      menu
      option = gets.chomp.to_i
      get_num(option)
      next unless option == 10

      puts '----'
      print "Thank you for using the Catalog of Things!\n"
      puts '----'
      exit!
    end
  end

  # check if file exist and creates file if not

  def check_files
    File.open('./files/musicalbums.json', 'a') unless File.exist?('./files/musicalbums.json')
    File.open('./files/games.json', 'a') unless File.exist?('./files/games.json')
    File.open('./files/books.json', 'a') unless File.exist?('./files/books.json')
  end

  def menu
    puts
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all games'
    puts '4 - List all genres'
    puts '5 - List all labels'
    puts '6 - List all authors'
    puts '7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a game'
    puts "10 - Exit\n"
    print "\n[Your Choice?]: "
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def get_num(option)
    case option
    when 1
      list_all_books
    when 2
      @list_albums.display
    when 3
      @list_games.display
    when 4
      @list_genres.display
    when 5
      list_all_labels
    when 6
      @list_authors.display
    when 7
      add_book
    when 8
      @create_album.create
    when 9
      @create_game.create
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
