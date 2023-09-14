require 'spec_helper'

describe Label do
  before :each do
    @label = Label.new('title', 'color')
    @item = Item.new(1, 'genre', 'author', @label, '01-01-2000')
  end

  describe '#add_item' do
    it "adds an item to the label's items array" do
      @label.add_item(@item)
      expect(@label.items).to include(@item)
    end

    it "sets the item's label to the label" do
      @label.add_item(@item)
      expect(@item.label).to eq(@label)
    end
  end
end
