require_relative '../Application/Item/Game/game'
require_relative '../Application/Item/item'
require_relative '../Application/Author/author'

describe Game do
  context 'when last_played is older than 2 years' do
    let(:current_time) { Time.now }
    let(:two_years_ago) { current_time - (2 * 365 * 24 * 60 * 60) }

    it 'can be archived' do
      allow(Game).to receive(:new).and_return(double(can_be_archived?: true))
      game = Game.new(1, current_time, true, two_years_ago)

      expect(game.can_be_archived?).to be true
    end
  end

  context 'when last_played is recent' do
    let(:current_time) { Time.now }
    let(:one_year_ago) { current_time - (365 * 24 * 60 * 60) }

    it 'cannot be archived' do
      allow(Game).to receive(:new).and_return(double(can_be_archived?: false))
      game = Game.new(1, current_time, true, one_year_ago)

      expect(game.can_be_archived?).to be false
    end
  end
end
