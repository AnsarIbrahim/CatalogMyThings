require_relative '../Application/Author/author'

describe Author do
  let(:author) { Author.new(1, 'John', 'Doe') }
  let(:item) { Item.new(1, Time.now, 'arg1_value', 'arg2_value', 'arg3_value') }

  it 'should add an item to the author' do
    author.add_item(item)
    expect(author.items).to include(item)
  end

  it 'should set the author of the added item' do
    author.add_item(item)
    expect(item.author).to eq(author)
  end
end
