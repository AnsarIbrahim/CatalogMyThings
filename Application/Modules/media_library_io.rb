require_relative "../Genre/genre"
require_relative "../Item/Music_Album/music_album"
require "json"

class MediaLibraryIO
  DATA_FILE_PATH = "Application/Data/media_library.json"

  # Convert a MusicAlbum object to a JSON-friendly hash
  def music_album_to_hash(music_album)
    {
      id: music_album.id,
      genre: music_album.genre.name,
      artist: music_album.artist,
      on_spotify: music_album.on_spotify,
    }
  end

   def find_or_create_genre(genre_name, genres)
    genre = genres.find { |g| g.name == genre_name }
    if genre.nil?
      # puts "Genre not found. Creating a new genre."
      genre = Genre.new(genres.length + 1, genre_name)
      genres << genre
    end
    genre
  end

  # Convert a JSON-friendly hash to a MusicAlbum object
  def hash_to_music_album(hash)
    MusicAlbum.new(
      id: hash["id"],
      genre: find_or_create_genre(hash["genre"]),
      artist: hash["artist"],
      on_spotify: hash["on_spotify"],
    )
  end

  def save_data(music_albums, genres)
    data = {
      music_albums: music_albums.map { |album| music_album_to_hash(album) },
      genres: genres.map(&:name).uniq,  # Ensure unique genre names
    }

    File.open(DATA_FILE_PATH, "w") do |file|
      file.write(JSON.pretty_generate(data))
    end
  end

  def load_data
    if File.exist?(DATA_FILE_PATH)
      begin
        data = JSON.parse(File.read(DATA_FILE_PATH))
        music_albums = data["music_albums"].map { |hash| hash_to_music_album(hash) }
        genres = data["genres"].map { |name| find_or_create_genre(name) }
        [music_albums, genres]
      rescue JSON::ParserError => e
        puts "Error loading data from media_library.json: #{e.message}"
        [[], []] # Return empty arrays in case of an error
      end
    else
      puts "Data file not found. Starting with empty collections."
      [[], []] # Return empty arrays when the file doesn't exist
    end
  end
end
