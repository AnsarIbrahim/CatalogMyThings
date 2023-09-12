class Item
  attr_accessor :genre, :author, :label, :publish_date
  attr_reader :id, :archived
# Create an object of the Item class
# my_item = Item.new("Sifi", "Issac Asimov", "The Foundation", Time.new(1942, 01, 31))
  def initialize(genre, author, label, publish_date)
    @id = Random.rand(4..4000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    # An item can be archived if it was published
    # more than 10 years ago.
    Time.now.year - @publish_date.year > 10
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
    else
      puts "Item cannot be archived..."
    end
  end
end