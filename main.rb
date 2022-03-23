require './game'
require './author'
require './list'
require './create'
require './item'

class Main
  def initialize
    @book = []
    @games = []
    @authors = []
    @labels = []
  end

  def start
    puts "\nWelcome to Catalog of Things!"
    puts "\nPlease choose an option by entering a number: "

    loop do
      option = list_options
      case option
      when 4
        list_games
      when 7
        list_authors
      when 12
        AddGames.new(@games).add_game
      when 13
        puts '----'
        puts "Thank you for using Catalog Of Things\n"
        puts '----'
        exit
      end
    end
  end

  def list_options
    puts "\n1 - List All Books?"
    puts '2 - List All Music Albums?'
    puts '3 - List All Movies?'
    puts '4 - List All Games?'
    puts '5 - List All Genres?'
    puts '6 - List All Labels?'
    puts '7 - List All Authors?'
    puts '8 - List All Sources?'
    puts '9 - Add A Book?'
    puts '10 - Add A Music Album?'
    puts '11 - Add A Movie?'
    puts '12 - Add A Game?'
    puts "13 - Exit\n"
    print "\n[Your Choice?]: "

    gets.chomp.to_i
  end
end

def list_games
  if @games.length.zero?
    puts "\nThere are no games in store for you, Try creating one\n"
    AddGames.new(@games).add_game
  else
    @games.each_with_index do |game, index|
      # rubocop:disable Layout/LineLength
      puts "#{index + 1}. [Multiplayer]: #{game.multiplayer}, [last played at]: #{game.last_played_at}, [publish at]: #{game.publish_date}"
      # rubocop:enable Layout/LineLength
    end
  end
end

def list_authors
  puts 'list of all authors'
  if @authors.length.zero?
    puts "\nThere are no authors in store for you!..."
  else
    @authors.each_with_index do |author, index|
      puts "#{index + 1}. [First Name]: #{author.first_name}, [Last Name]: #{author.last_name}"
    end
  end
end

main = Main.new
main.start
