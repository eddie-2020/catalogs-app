class ListCatalogs
  include Main
  def list_authors
    if @authors.length.zero?
      puts 'Author list is empty'
    else
      @authors.each_with_index do |author, index|
        puts "#{index + 1}. [First Name]: #{author.first_name}, [Last Name]: #{author.last_name}"
      end
    end
    # rubocop:disable Layout/LineLength
    # rubocop:disable Lint/NestedMethodDefinition
    def list_games
      if @games.length.zero?
        puts 'There are no games added!'
      else
        @games.each_with_index do |game, index|
          puts "#{index + 1}. [Multiplayer]: #{game.multiplayer}, [last played at]: #{game.last_played_at}, [Publish date]: #{game.publish_date}"
        end
      end
    end
  end
  # rubocop:enable Lint/NestedMethodDefinition
  # rubocop:enable Layout/LineLength
end
