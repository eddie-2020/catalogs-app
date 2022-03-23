require_relative './save-data'
require_relative './musicalbum'
require_relative './genre'

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

class ListGenres
    def display
        data = SaveData.new
        #List genres from books, games, and music albums
        music_album_list = data.read_from_file('./files/musicalbums.json')
        book_list = data.read_from_file('./files/books.json')
        game_list = data.read_from_file('./files/games.json')

        puts "\nMusic Genre[s]"
        puts '---------------'
        if music_album_list == 1
            puts 'No Music genres in the library. Please add a music album.'
        else
            puts music_album_list.map {|musicalbum| musicalbum['genre']['name']}.uniq 
        end
        #book genres
        puts "\nBook Genre[s]"
        puts '---------------'
        if  book_list == 1
            puts 'No Book genres in the library.Please add a book item.'
        else
            puts book_list.map {|book| book['genre']['name']}.uniq 
        end
        #game genres
        puts "\nGame Genre[s]"
        puts '---------------'
        if  game_list == 1
            puts 'No Book genres in the library. Please add a game item.'
        else
            puts game_list.map {|game| game['genre']['name']}.uniq 
        end
    end
end