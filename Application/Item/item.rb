require 'date'
class Item
  attr_accessor :id, :genre, :author, :label, :publish_date, :archived

  def initialize(id, genre, author, label, publish_date)
    @id = id
    @genre = genre
    @author = author
    @label = label
    @publish_date = Date.strptime(publish_date, '%d-%m-%Y')
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
      puts 'Item cannot be archived...'
    end
  end
end
