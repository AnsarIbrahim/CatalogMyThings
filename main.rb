require_relative 'Application/app'

books = []
music_albums = []
movies = []
games = []
genres = []
labels = []
authors = []
sources = []

loop do
  puts "\nOptions:"
  puts '1. List all books'
  puts '2. List all music albums'
  puts '3. List all movies'
  puts '4. List all games'
  puts '5. List all genres'
  puts '6. List all labels'
  puts '7. List all authors'
  puts '8. List all sources'
  puts '9. Add a book'
  puts '10. Add a music album'
  puts '11. Add a movie'
  puts '12. Add a game'
  puts '13. Quit'

  print 'Please select an option (1-13): '
  choice = gets.chomp.to_i

  case choice
  when 1
    puts 'List of all books:'
    puts books
  when 2
    puts 'List of all music albums:'
    puts music_albums
  when 3
    puts 'List of all movies:'
    puts movies
  when 4
    puts 'List of all games:'
    puts games
  when 5
    puts 'List of all genres:'
    puts genres
  when 6
    puts 'List of all labels:'
    puts labels
  when 7
    puts 'List of all authors:'
    puts authors
  when 8
    puts 'List of all sources:'
    puts sources
  when 9
    print 'Enter the title of the book: '
    book_title = gets.chomp
    books << book_title
    puts "Book added: #{book_title}"
  when 10
    print 'Enter the title of the music album: '
    album_title = gets.chomp
    music_albums << album_title
    puts "Music album added: #{album_title}"
  when 11
    print 'Enter the title of the movie: '
    movie_title = gets.chomp
    movies << movie_title
    puts "Movie added: #{movie_title}"
  when 12
    print 'Enter the title of the game: '
    game_title = gets.chomp
    games << game_title
    puts "Game added: #{game_title}"
  when 13
    puts 'Exiting the app. Goodbye!'
    break
  else
    puts 'Invalid option. Please select a valid option (1-13).'
  end
end
