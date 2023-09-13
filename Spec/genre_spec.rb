require_relative '../Application/Genre/genre'
require_relative '../Application/Item/Music_Album/music_album'

describe Genre do
  let(:genre) { Genre.new(1, 'Rock') }
  let(:music_album) { MusicAlbum.new(id: 1, genre: genre, artist: 'Artist Name', on_spotify: true) }

  describe '#add_item' do
    it 'adds an item to the genre' do
      genre.add_item(music_album)
      expect(genre.items).to include(music_album)
    end

    it 'sets the genre of the item' do
      genre.add_item(music_album)
      expect(music_album.genre).to eq(genre)
    end
  end
end
