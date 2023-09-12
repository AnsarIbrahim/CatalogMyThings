require_relative 'menu_display'
require_relative '../Modules/media_library'

media_library = MediaLibrary.new

def main_menu(media_library)
  loop do
    display_menu
    print 'Please select an option (1-13 or 14 to quit): '
    choice = gets.chomp.to_i

    case choice
    when 1..5
      handle_listing_option(choice, media_library)
    when 6..8
      handle_listing_labels_or_authors(choice, media_library)
    when 9..12
      handle_adding_option(choice, media_library)
    when 13
      exit_app
      break
    else
      invalid_option_message
    end
  end
end

def handle_listing_option(choice, media_library)
  case choice
  when 1
    list_books(media_library.books)
  when 2
    media_library.list_music_albums
  when 3
    list_movies(media_library.movies)
  when 4
    list_games(media_library.games)
  when 5
    media_library.list_genres
  end
end

def handle_listing_labels_or_authors(choice, media_library)
  case choice
  when 6
    list_labels(media_library.labels)
  when 7
    list_authors(media_library.authors)
  when 8
    list_sources(media_library.sources)
  end
end

def handle_adding_option(choice, media_library)
  case choice
  when 9
    add_book(media_library.books)
  when 10
    media_library.add_music_album
  when 11
    add_movie(media_library.movies)
  when 12
    add_game(media_library.games)
  end
end

def exit_app
  puts 'Exiting the app. Goodbye!'
end

def invalid_option_message
  puts 'Invalid option. Please select a valid option (1-13 or 14 to quit).'
end

main_menu(media_library)
