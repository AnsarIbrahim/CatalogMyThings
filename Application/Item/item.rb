require 'date'
class Item
  attr_accessor :id, :genre, :author, :label, :publish_date, :archived

  def initialize(id, genre, author, label, publish_date)
    @id = id
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
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
