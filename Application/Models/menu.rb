require_relative 'menu_display'

MediaLibrary = Struct.new(:books, :music_albums, :movies, :games, :genres, :labels, :authors, :sources)

def initialize_data
  MediaLibrary.new([], [], [], [], [], [], [], [])
end

def display_media(media_list)
  media_list.each_with_index do |item, index|
    puts "#{index + 1}. #{item}"
  end
end

def list_media(title, media_list)
  puts "List of #{title}:"
  display_media(media_list)
end

def add_media(title, _media_list)
  puts "Enter #{title} details:"
end

MENU_OPTIONS = {
  1 => { option: 'books', method: :list_books },
  2 => { option: 'music albums', method: :list_music_albums },
  3 => { option: 'movies', method: :list_movies },
  4 => { option: 'games', method: :list_games },
  5 => { option: 'genres', method: :list_genres },
  6 => { option: 'labels', method: :list_labels },
  7 => { option: 'authors', method: :list_authors },
  8 => { option: 'sources', method: :list_sources },
  9 => { option: 'book', method: :add_book },
  10 => { option: 'music album', method: :add_music_album },
  11 => { option: 'movie', method: :add_movie },
  12 => { option: 'game', method: :add_game },
  13 => { option: 'Quit', method: nil }
}.freeze

def main_menu(media_library)
  loop do
    display_menu
    print 'Please select an option (1-13): '
    choice = gets.chomp.to_i

    menu_option = MENU_OPTIONS[choice]

    if menu_option
      if menu_option[:method]
        send(menu_option[:method], menu_option[:option], media_library.send(menu_option[:option]))
      else
        puts 'Exiting the app. Goodbye!'
        break
      end
    else
      puts 'Invalid option. Please select a valid option (1-13).'
    end
  end
end

media_library = initialize_data
main_menu(media_library)
