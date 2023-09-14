require 'spec_helper'

describe Book do
  before :each do
    @book = Book.new(1, 'genre', 'author', 'label', nil, 'publisher', 'cover_state')
  end

  describe '#can_be_archived?' do
    context 'when the book is more than 10 years old' do
      it 'returns true' do
        @book.publish_date = Date.new(2000, 0o1, 0o1)
        expect(@book.can_be_archived?).to eq(true)
      end
    end

    context 'when the book is less than 10 years old and cover state is not bad' do
      it 'returns false' do
        @book.publish_date = Date.new(2020, 0o1, 0o1)
        @book.cover_state = 'good'
        expect(@book.can_be_archived?).to eq(false)
      end
    end

    context 'when the book is less than 10 years old and cover state is bad' do
      it 'returns true' do
        @book.publish_date = Date.new(2020, 0o1, 0o1)
        @book.cover_state = 'bad'
        expect(@book.can_be_archived?).to eq(true)
      end
    end
  end
end
