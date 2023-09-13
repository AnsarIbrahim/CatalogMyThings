require_relative '../Genre/genre'
require_relative '../Item/Music_Album/music_album'
require 'json'

class MediaLibraryIO
  DATA_FILE_PATH = 'Application/Data/media_library.json'.freeze

  def initialize(genres)
    @genres = genres
  end

  def music_album_to_hash(music_album)
    {
      id: music_album.id,
      genre: music_album.genre.name,
      artist: music_album.artist,
      on_spotify: music_album.on_spotify
    }
  end

  def find_or_create_genre(genre_name, genres)
    genre = genres.find { |g| g.name == genre_name }
    if genre.nil?
      genre = Genre.new(genres.length + 1, genre_name)
      genres << genre
    end
    genre
  end

  def hash_to_music_album(hash, genres)
    MusicAlbum.new(
      id: hash['id'],
      genre: find_or_create_genre(hash['genre'], genres),
      artist: hash['artist'],
      on_spotify: hash['on_spotify']
    )
  end

  def save_data(music_albums, genres)
    data = {
      music_albums: music_albums.map { |album| music_album_to_hash(album) },
      genres: genres.map(&:name).uniq
    }

    File.write(DATA_FILE_PATH, JSON.pretty_generate(data))
  end

  def load_data
    if File.exist?(DATA_FILE_PATH)
      begin
        data = JSON.parse(File.read(DATA_FILE_PATH))
        music_albums = data['music_albums'].map { |hash| hash_to_music_album(hash, @genres) }
        genres = data['genres'].map { |name| find_or_create_genre(name, @genres) }
        { music_albums: music_albums, genres: genres }
      rescue JSON::ParserError => e
        puts "Error loading data from media_library.json: #{e.message}"
        { music_albums: [], genres: [] }
      end
    else
      puts 'Data file not found. Starting with empty collections.'
      { music_albums: [], genres: [] }
    end
  end
end
