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
            puts "(#{index}) Publish Date: #{musicalbum['publish_date']}, On spotify: #{musicalbum['on_spotify']}"
            end
        end
  end
end

class ListGenres
    def display
        data = SaveData.new
        #music genres
        music_album_list = data.read_from_file('./files/musicalbums.json')
        if music_album_list == 1
        puts 'No Music genres in the library'
        else
            music_album_list.each_with_index do |musicalbum, index|
                genre =  musicalbum['genre'].name
                puts genre.class
            # puts "(#{index}) Genre: #{musicalbum['genre']}"
            end
        end
        # puts Genre.class_variable_get(@@items)
    end
end