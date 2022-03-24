def list_all_books
  data = SaveData.new
  books = data.read_from_file('./files/books.json')

  if books == 1
    puts 'No Book in the library'
  else
    books.each_with_index do |book, index|
      puts "(#{index + 1}) Book Name: #{book['label']['title']}, Author: #{book['author']['first_name']} #{book['author']['first_name']}"
    end
  end
  sleep 0.75
end

def list_all_labels
  data = SaveData.new
  music_album_list = data.read_from_file('./files/musicalbums.json')
  book_list = data.read_from_file('./files/books.json')
  game_list = data.read_from_file('./files/games.json')

  puts "\nMusic Labels"
  puts '---------------'
  if music_album_list == 1
    puts 'No Music labels in the library. Please add a music album.'
  else
    puts music_album_list.map { |musicalbum| musicalbum['genre']['name'] }.uniq
  end

  puts "\nBook Labelss"
  puts '---------------'
  if book_list == 1
    puts 'No Book labels in the library.Please add a book item.'
  else
    puts book_list.map { |book| book['genre']['name'] }.uniq
  end

  puts "\nGame Labels"
  puts '---------------'
  if game_list == 1
    puts 'No Book labels in the library. Please add a game item.'
  else
    puts game_list.map { |game| game['genre']['name'] }.uniq
  end
end
