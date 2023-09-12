class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = Random.rand(3..3000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.label = self
    @item << item
  end
  
end
