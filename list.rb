def list_all_books
  puts 'No books are created yet! Please use option 9 to create a books.' if @books.empty?

  @books.each { |book| puts "Title: #{book.label.title}, Author: #{book.author.first_name + ' ' + book.author.last_name}" }
  sleep 0.75
end

def list_all_labels
  puts 'No books are created yet! Please use option 9 to create a books.' if @books.empty?
  @books.each { |book| puts "Type: Book, Label: #{book.label.title}" }
end