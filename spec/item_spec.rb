require_relative '../item'

describe Item do
  context 'When testing Item' do
    it 'the item should true and the can to archived method to be false.' do
      item = Item.new('15-03-22')

      expect(item.can_be_archived?).to be false
    end
  end
end
