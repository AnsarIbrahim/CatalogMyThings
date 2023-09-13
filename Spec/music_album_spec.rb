require_relative '../Application/Item/Music_Album/music_album'
require_relative '../Application/Genre/genre'
require_relative '../Application/Item/item'

describe MusicAlbum do
  let(:genre) { Genre.new(1, 'Rock') }
  let(:music_album) do
    MusicAlbum.new(
      id: 1,
      genre: genre,
      artist: 'Artist Name',
      on_spotify: true,
      publish_date: Time.now
    )
  end

  describe '#can_be_archived?' do
    it 'returns true if parent method returns true and on_spotify is true' do
      allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(true)

      expect(music_album.can_be_archived?).to eq(true)
    end

    it 'returns false if parent method returns false' do
      allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(false)

      expect(music_album.can_be_archived?).to eq(false)
    end
  end
end
