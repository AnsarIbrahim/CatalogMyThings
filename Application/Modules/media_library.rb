require_relative '../Genre/genre'
require_relative '../Item/Music_Album/music_album'
require_relative 'media_library_io'

class MediaLibrary
  attr_accessor :music_albums, :genres

  def initialize
    @genres = []
    @music_albums = []
    @media_library_io = MediaLibraryIO.new(@genres)
    load_from_json
  end

  def list_music_albums
    puts 'List of Music Albums:'
    music_albums.each do |album|
      puts "Id: #{album.id}, Artist: #{album.artist}, On Spotify: #{album.on_spotify}, " \
           "Publish Date: #{album.publish_date}"
    end
  end

  def list_genres
    puts 'List of Genres:'
    genres.each do |genre|
      puts genre.name['name']
    end
  end

  def add_music_album
    artist = artist_input
    publish_date = publish_date_input
    genre = select_or_create_genre
    on_spotify = spotify_status_input

    create_and_store_music_album(artist, genre, on_spotify, publish_date)

    save_to_json
  end

  def save_to_json
    @media_library_io.save_data(@music_albums, @genres)
  end

  def load_from_json
    loaded_data = @media_library_io.load_data
    @music_albums = loaded_data[:music_albums]
    @genres = loaded_data[:genres]
  end

  private

  def artist_input
    puts 'Enter the artist:'
    gets.chomp
  end

  def publish_date_input
    puts 'Enter the publish date (DD-MM-YYYY):'
    date_input = gets.chomp
    day, month, year = date_input.split('-').map(&:to_i)

    begin
      Date.new(year, month, day)
    rescue ArgumentError
      puts 'Invalid date format. Please enter the date in DD-MM-YYYY format.'
      publish_date_input
    end
  end

  def select_or_create_genre
    puts 'Available Genres:'
    list_genres

    puts 'Enter the genre (select from the above list):'
    genre_name = gets.chomp
    genre = genres.find { |g| g.name == genre_name }

    if genre.nil?
      genre = Genre.new(genres.length + 1, genre_name)
      genres << genre
    end

    genre
  end

  def spotify_status_input
    puts 'Is the album on Spotify? (true/false):'
    gets.chomp.downcase == 'true'
  end

  def create_and_store_music_album(artist, genre, on_spotify, publish_date)
    music_album = MusicAlbum.new(
      id: music_albums.length + 1,
      genre: genre,
      artist: artist,
      on_spotify: on_spotify,
      publish_date: publish_date
    )
    music_albums << music_album
    puts 'Music album added successfully!'
  end
end
