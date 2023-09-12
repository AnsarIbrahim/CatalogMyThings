class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name)
    id = Random.rand(2..2000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self
    @items << item
end
