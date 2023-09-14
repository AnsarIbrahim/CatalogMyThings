require_relative '../item'

class Book < Item
  attr_accessor :publisher, :cover_state

  # rubocop:disable Metrics/ParameterLists
  def initialize(id, genre, author, label, publish_date, publisher, cover_state)
    super(id, genre, author, label, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  # rubocop:enable Metrics/ParameterLists
  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
