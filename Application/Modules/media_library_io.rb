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
      on_spotify: music_album.on_spotify,
      publish_date: music_album.publish_date
    }
  end

  def genre_to_hash(genre)
    {
      id: genre.id,
      name: genre.name.to_s
    }
  end

  def find_or_create_genre(genre_name)
    genre = @genres.find { |g| g.name == genre_name }
    if genre.nil?
      genre = Genre.new(@genres.length + 1, genre_name)
      @genres << genre
    end
    genre
  end

  def hash_to_music_album(hash)
    MusicAlbum.new(
      id: hash['id'],
      genre: find_or_create_genre(hash['genre']),
      artist: hash['artist'],
      on_spotify: hash['on_spotify'],
      publish_date: hash['publish_date']
    )
  end

  def save_data(music_albums, genres)
    genre_data = genres.map do |genre|
      {
        id: genre.id,
        name: genre.name
      }
    end

    data = {
      music_albums: music_albums.map { |album| music_album_to_hash(album) },
      genres: genre_data
    }

    File.write(DATA_FILE_PATH, JSON.pretty_generate(data))
  end

  def load_data
    data = load_data_from_file(DATA_FILE_PATH)
    if data
      music_albums = data['music_albums'].map do |hash|
        hash_to_music_album(hash)
      end

      genres = data['genres'].map do |name|
        find_or_create_genre(name)
      end

      { music_albums: music_albums, genres: genres }
    else
      { music_albums: [], genres: [] }
    end
  end

  def load_data_from_file(file_path)
    return nil unless File.exist?(file_path)

    JSON.parse(File.read(file_path))
  rescue JSON::ParserError => _e
    nil
  end
end
