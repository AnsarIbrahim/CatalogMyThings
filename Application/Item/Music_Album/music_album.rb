require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotifiy

  def initialize(on_spotifiy, genre, author, label, publish_date)
    super(genre, author, label, publish_date)
    @on_spotifiy = on_spotifiy
  end

  def can_be_archived?
    super && @on_spotifiy
  end
end
