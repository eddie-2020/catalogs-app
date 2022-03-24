require 'date'
require 'pry'
require_relative './game'
require_relative './create'
require_relative './list'

class App
  def run
    check_files

    @create_game = CreateGames.new
    @list_games = ListGames.new
    @list_authors = ListAuthors.new
    puts 'Welcome to Catalog of Things!'
    loop do
      menu
      option = gets.chomp.to_i
      get_num(option)
      next unless option == 13

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
    puts '3 - List all movies'
    puts '4 - List all games'
    puts '5 - List all genres'
    puts '6 - List all labels'
    puts '7 - List all authors'
    puts '8 - List all sources'
    puts '9 - Add a book'
    puts '10 - Add a music album'
    puts '11 - Add a movie'
    puts '12 - Add a game'
    puts "13 - Exit\n"
    print "\n[Your Choice?]: "
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def get_num(option)
    case option
    when 1
      list_all_books
    when 2
      list_albums
    when 3
      list_all_movies
    when 4
      @list_games.display
    when 5
      list_genres
    when 6
      list_all_labels
    when 7
      @list_authors.display
    when 8
      list_all_sources
    when 9
      add_book
    when 10
      create_album
    when 11
      add_movie
    when 12
      @create_game.create
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def list_all_books
    sleep 0.75
  end

  def list_all_music_albums
    sleep 0.75
  end

  def list_all_movies
    sleep 0.75
  end

  def list_all_games
    sleep 0.75
  end

  def list_all_genres
    sleep 0.75
  end

  def list_all_labels
    sleep 0.75
  end

  def list_all_authors
    sleep 0.75
  end

  def list_all_sources
    sleep 0.75
  end

  def add_book; end

  def add_movie; end
end
