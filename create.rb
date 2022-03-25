require_relative './game'
require_relative './item'
require_relative './save_data'
require_relative './musicalbum'
require_relative './to_hash'
require_relative './book'
require_relative './label'
require_relative './author'
require_relative './genre'

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

    genre = Genre.new(genre_name)
    author = Author.new(first_name, last_name)
    label = Label.new(title, color)

    musicalbum = MusicAlbum.new(publish_date, on_spotify)

    archived = musicalbum.move_to_archive

    genre.add_item(musicalbum)
    author.add_item(musicalbum)
    label.add_item(musicalbum)

    musicalbum_hash = to_hash.to_hash(musicalbum)
    data.write_to_file('./files/musicalbums.json', musicalbum_hash)
    puts "\n#{title} by #{first_name} #{last_name} album was created successfully"
  end
end

class CreateGames
  def create
    data = SaveData.new
    to_hash = ToHash.new

    # Get multiplayer
    print "\nEnter multiplayer: "
    multiplayer = gets.chomp

    print "\nEnter last played at [YYYY/MM/DD]: "
    last_played_at = gets.chomp

    print "\nEnter publish date [YYYY/MM/DD]: "
    publish_date = gets.chomp
    puts '----'
    puts 'Who created the game?'
    puts '----'
    print "[Author\'s First Name]: "
    first_name = gets.chomp
    print "\n[Author\'s Last Name]: "
    last_name = gets.chomp

    # Get game label
    puts '----'
    puts "What is the game\'s title and type?"
    puts '----'
    print "[Enter Game\'s title]: "
    title = gets.chomp
    puts '----'
    print "[Enter Game\'s Color]: "
    color = gets.chomp
    print "\n[Enter Game\'s type] (Adventure, Action, Racing...): "
    type = gets.chomp
    # rubocop:enable Lint/UselessAssignment

    # Check if game is archived
    puts '----'
    puts "Are the inserted game\'s archived yet?"
    puts '----'
    print 'Is game archived? [Y/N]: '
    can_be_archived = gets.chomp.downcase
    # rubocop:disable Lint/UselessAssignment
    case can_be_archived
    when 'y' || 'Y'
      archived = true
    else
      archived = false
      puts "\n[INVALID]: Not archived yet..."
    end
    # rubocop:enable Lint/UselessAssignment

    # Get author class attributes
    author = Author.new(first_name, last_name)
    label = Label.new(title, color)
    genre = Genre.new(type)

    # Get game class attributes
    game = Game.new(multiplayer, last_played_at, publish_date)

    author.add_item(game)
    label.add_item(game)
    genre.add_item(game)

    # Save in hash format
    game_hash = to_hash.to_hash(game)

    # Save in game.json
    data.write_to_file('./files/games.json', game_hash)
    puts "\n#{title} game was created successfully!"
  end
  # rubocop:enable  Metrics/MethodLength
end

def add_book
  data = SaveData.new
  to_hash = ToHash.new

  puts 'Please enter the books name'
  title = gets.chomp

  puts 'Please enter the books color'
  color = gets.chomp

  puts 'Please enter the authors first name'
  first_name = gets.chomp

  puts 'Please enter the authors last name'
  last_name = gets.chomp

  puts 'Please enter the genre'
  name = gets.chomp

  puts 'Please enter the publisher'
  publisher = gets.chomp

  puts 'Please enter the state of the cover(good or bad)'
  cover_state = gets.chomp

  puts 'Please enter publish date in the following formet[yy-mm-dd]'
  publish_date = gets.chomp.to_s

  puts 'Has the book been archived? [true/false]'
  archived = gets.chomp.downcase == 'y'

  author = Author.new(first_name, last_name)
  label = Label.new(title, color)
  genre = Genre.new(name)

  book = Book.new(publisher, cover_state, publish_date)
  book.move_to_archive
  author.add_item(book)
  label.add_item(book)
  genre.add_item(book)

  book_hash = to_hash.to_hash(book)
  data.write_to_file('./files/books.json', book_hash)

  puts 'Book successfully added!'
  sleep 0.75
end
