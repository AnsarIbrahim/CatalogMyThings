require_relative "../Genre/genre"
require_relative "../Item/Music_Album/music_album"
require_relative "media_library_io"
# require "json"

class MediaLibrary
  attr_accessor :music_albums, :genres

  # DATA_FILE_PATH = "Application/Data/media_library.json"

  def initialize
    @media_library_io = MediaLibraryIO.new
    @music_albums, @genres = @media_library_io.load_data
  end

  # Function to list all music albums
  def list_music_albums
    puts "List of Music Albums:"
    music_albums.each do |album|
      puts "Artist: #{album.artist}, Genre: #{album.genre.name}, On Spotify: #{album.on_spotify}"
    end
  end

  # Function to list all genres
  def list_genres
    puts "List of Genres:"
    genres.each do |genre|
      puts genre.name
    end
  end

  # Add a new genre if it doesn't exist
  def find_or_create_genre(genre_name)
    genre = genres.find { |g| g.name == genre_name }
    if genre.nil?
      # puts "Genre not found. Creating a new genre."
      genre = Genre.new(genres.length + 1, genre_name)
      genres << genre
    end
    genre
  end

  def add_music_album
    artist = artist_input
    genre = select_or_create_genre
    on_spotify = spotify_status_input

    create_and_store_music_album(artist, genre, on_spotify)

    save_to_json # Save after adding
  end

  # Save data using MediaLibraryIO
  def save_to_json
    @media_library_io.save_data(@music_albums, @genres)
  end

  private

  def artist_input
    puts "Enter the artist:"
    gets.chomp
  end

  def select_or_create_genre
    puts "Available Genres:"
    list_genres

    puts "Enter the genre (select from the above list):"
    genre_name = gets.chomp
    genre = genres.find { |g| g.name == genre_name }

    if genre.nil?
      genre = Genre.new(genres.length + 1, genre_name)
      genres << genre
    end

    genre
  end

  def spotify_status_input
    puts "Is the album on Spotify? (true/false):"
    gets.chomp.downcase == "true"
  end

  def create_and_store_music_album(artist, genre, on_spotify)
    music_album = MusicAlbum.new(
      id: music_albums.length + 1,
      genre: genre,
      artist: artist,
      on_spotify: on_spotify,
    )
    music_albums << music_album
    puts "Music album added successfully!"
  end
end
