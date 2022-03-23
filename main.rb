require './game'
require './list'
require './create'

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
      break if option == 13

      list_games if option == 4
      add_game if option == 12
    end
  end

  def list_options
    puts "\n1 - List All Books"
    puts '2 - List All Music Albums'
    puts '3 - List All Movies'
    puts '4 - List All Games'
    puts '5 - List All Genres'
    puts '6 - List All Labels'
    puts '7 - List All Authors'
    puts '8 - List All Sources'
    puts '9 - Add A Book'
    puts '10 - Add A Music Album'
    puts '11 - Add A Movie'
    puts '12 - Add A Game'
    puts "13 - Exit\n"
    print "\n[Your Choice?]: "

    gets.chomp.to_i
  end
end

main = Main.new
main.start
