require './main'
require './game'
require './author'

class ListCatalogs
  def initialize(_games, _authors)
    @games = []
    @authors = []
  end
end

class ListAuthors < ListCatalogs
  def list_authors
    puts 'list of all authors'
    if @authors.zero?
      puts 'Author list is empty'
    else
      @authors.each_with_index do |author, index|
        puts "#{index + 1}. [First Name]: #{author.first_name}, [Last Name]: #{author.last_name}"
      end
    end
  end
end

# class ListGames < ListCatalogs
#   def list_games
#     if @games.length.zero?
#       puts 'There are no games in store for you, Try creating one'
#       AddGames.new(@games).add_game
#     else
#       @games.each_with_index do |game, index|
# rubocop:disable Layout/LineLength
#         puts "#{index + 1}. [Multiplayer]: #{game.multiplayer}, [last played at]: #{game.last_played_at}, [publish at]: #{game.publish_date}"
# rubocop:enable Layout/LineLength
#       end
#     end
#   end
# end
