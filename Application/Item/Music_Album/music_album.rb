require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :artist

  def initialize(id:, genre:, artist:, on_spotify:, publish_date: Time.now)
    super(id, genre, artist, label, publish_date)
    @on_spotify = on_spotify
    @artist = artist
  end

  def can_be_archived?
    super && @on_spotify
  end
end
