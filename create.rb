require_relative './musicalbum'
require_relative './save_data'
# require_relative './label'
# require_relative './author'
require_relative './genre'
require_relative './to_hash'
class CreateMusicAlbum
  # rubocop:disable  Metrics/MethodLength
  def create
    data = SaveData.new
    to_hash = ToHash.new

    # get publish date
    print "\nEnter Publish Date [YYYY/MM/DD]: "
    publish_date = gets.chomp.to_s

    # get if album is on spotify
    print "\nIs music album on spotify? [Y/N]: "
    value = gets.chomp.downcase
    case value
    when 'y' || 'Y'
      on_spotify = true
    else
      on_spotify = false
      puts "\n[INVALID]: No Spotify..."
    end

    # get album genre
    puts "\nEnter Album Genre: "
    genre_name = gets.chomp

    # rubocop:disable Lint/UselessAssignment

    # get album author/singer
    puts '----'
    puts 'This album was created by?'
    puts '----'
    print '[First name]: '
    first_name = gets.chomp
    print "\n[Last name]: "
    last_name = gets.chomp

    # get album label
    puts '----'
    puts "What is the album\'s title and color?"
    puts '----'
    print "[Album\'s title]: "
    title = gets.chomp
    print "\n[Album\'s color]: "
    color = gets.chomp

    # create author, genre, label objects
    # rubocop:enable Lint/UselessAssignment

    # author = Author.new(first_name, last_name) #to uncomment when author class is ready
    # label = Label.new(title, color) #to uncomment when label class is ready
    genre = Genre.new(genre_name)

    musicalbum = MusicAlbum.new(publish_date, on_spotify)

    archived = musicalbum.move_to_archive

    # author.add_item(musicalbum) #to uncomment when author class is ready
    # label.add_item(musicalbum) #to uncomment when label class is ready
    genre.add_item(musicalbum)
    # save data in './files/musicalbums.json'
    musicalbum_hash = to_hash.to_hash(musicalbum)
    data.write_to_file('./files/musicalbums.json', musicalbum_hash)
    puts "\n#{title} by #{first_name} #{last_name} album was created successfully"
  end
  # rubocop:enable  Metrics/MethodLength
end
