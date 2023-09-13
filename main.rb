require_relative 'Application/Models/menu'
require_relative 'Application/Models/menu_display'

puts "\nWelcome to the Media Library!"
puts 'Please choose an option:'
puts '1. Start Media Library'
puts '2. Quit'

print 'Enter your choice (1 or 2): '
start_choice = gets.chomp.to_i

case start_choice
when 1
  books = []
  music_albums = []
  movies = []
  games = []
  genres = []
  labels = []
  authors = []
  sources = []

  run_menu(books, music_albums, movies, games, genres, labels, authors, sources)
when 2
  puts 'Exiting the app. Goodbye!'
else
  puts 'Invalid choice. Please select 1 to start the Media Library or 2 to quit.'
end
