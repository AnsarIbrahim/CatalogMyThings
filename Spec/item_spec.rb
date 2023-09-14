require 'date'
require_relative '../Application/Item/item'

describe Item do
  let(:current_year) { Time.now.year }
  let(:ten_years_ago) { current_year - 10 }

  context 'when creating an item' do
    it 'has default attributes' do
      item = Item.new(1, 'Genre', 'Author', 'Label', Date.new(current_year - 5))

      expect(item.id).to eq(1)
      expect(item.genre).to eq('Genre')
      expect(item.author).to eq('Author')
      expect(item.label).to eq('Label')
      expect(item.publish_date).to eq(Date.new(current_year - 5))
      expect(item.archived).to be_falsey
    end
  end

  context 'when checking if an item can be archived' do
    it 'returns true for an item published over 10 years ago' do
      item = Item.new(1, 'Genre', 'Author', 'Label', Date.new(ten_years_ago - 1))

      expect(item.can_be_archived?).to be_truthy
    end

    it 'returns false for an item published exactly 10 years ago' do
      item = Item.new(1, 'Genre', 'Author', 'Label', Date.new(ten_years_ago))

      expect(item.can_be_archived?).to be_falsey
    end

    it 'returns false for an item published less than 10 years ago' do
      item = Item.new(1, 'Genre', 'Author', 'Label', Date.new(current_year - 5))

      expect(item.can_be_archived?).to be_falsey
    end
  end

  context 'when moving an item to the archive' do
    it 'archives the item if it can be archived' do
      item = Item.new(1, 'Genre', 'Author', 'Label', Date.new(ten_years_ago - 1))

      item.move_to_archive

      expect(item.archived).to be_truthy
    end

    it 'does not archive the item if it cannot be archived' do
      item = Item.new(1, 'Genre', 'Author', 'Label', Date.new(current_year - 5))

      expect { item.move_to_archive }.to output("Item cannot be archived...\n").to_stdout
      expect(item.archived).to be_falsey
    end
  end
end
