
  # # Convert a MusicAlbum object to a JSON-friendly hash
  # def music_album_to_hash(music_album)
  #   {
  #     id: music_album.id,
  #     genre: music_album.genre.name,
  #     artist: music_album.artist,
  #     on_spotify: music_album.on_spotify,
  #   }
  # end

  # # Convert a JSON-friendly hash to a MusicAlbum object
  # def hash_to_music_album(hash)
  #   MusicAlbum.new(
  #     id: hash["id"],
  #     genre: find_or_create_genre(hash["genre"]),
  #     artist: hash["artist"],
  #     on_spotify: hash["on_spotify"],
  #   )
  # end

  # # Save data to a JSON file
  # def save_to_json
  #   data = {
  #     music_albums: @music_albums.map { |album| music_album_to_hash(album) },
  #     genres: @genres.map(&:name).uniq,  # Ensure unique genre names
  #   }

  #   File.open(DATA_FILE_PATH, "w") do |file|
  #     file.write(JSON.pretty_generate(data))
  #   end
  # end

  # # Load data from JSON and convert it back to objects
  # def load_from_json
  #   if File.exist?(DATA_FILE_PATH)
  #     begin
  #       data = JSON.parse(File.read(DATA_FILE_PATH))
  #       @music_albums = data["music_albums"].map { |hash| hash_to_music_album(hash) }
  #       @genres = data["genres"].map { |name| find_or_create_genre(name) }
  #     rescue JSON::ParserError => e
  #       puts "Error loading data from media_library.json: #{e.message}"
  #     end
  #   else
  #     puts "Data file not found. Starting with empty collections."
  #   end
  # end