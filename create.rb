require_relative './musicalbum'
require_relative './save-data'
# require_relative './label'
# require_relative './author'
require_relative './genre'

class CreateMusicAlbum 
    def create
        data = SaveData.new
        #get publish date
        puts 'Publish Date[yy-mm-dd]: '
        publish_date = gets.chomp.to_s
        #get if album is on spotify
        puts 'Is music album on spotify? [Y/N]'
        value = gets.chomp.downcase
            if value == 'y'
            on_spotify = true
            elsif value == 'n'
            on_spotify = false
            end
        #get album genre
        puts 'Album Genre: '
        genre_name = gets.chomp
        # #get album author/singer
        # puts 'Album by: '
        # puts 'First name: '
        # first_name = gets.chomp
        # puts 'Last name: '
        # last_name = gets.chomp
        # #get album label
        # puts 'Album\'s title: '
        # title = gets.chomp
        # puts 'Album\'s color: '
        # color = gets.chomp        
        #if archived
        puts 'Is album archived? [Y/N]'
        archived = gets.chomp.downcase == 'y'
        #create author, genre, label objects

        # author = Author.new(first_name, last_name)
        # label = Label.new(title, color)
        genre = Genre.new(genre_name)

        musicalbum = MusicAlbum.new(publish_date, on_spotify)

        # author.add_item(musicalbum) unless Author.items.include?(musicalbum)
        # label.add_item(musicalbum) unless Label.items.include?(musicalbum)
        genre.add_item(musicalbum) unless Genre.class_variable_get(:@@items).include?(musicalbum)

        musicalbum_hash = {}
        musicalbum.instance_variables.each {|var| musicalbum_hash[var.to_s.delete("@")] = musicalbum.instance_variable_get(var) }

        p musicalbum_hash 
        data.write_to_file('./files/musicalbums.json', musicalbum_hash)
        puts "Music album created successfully" 
    end
end