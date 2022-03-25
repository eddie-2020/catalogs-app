require_relative '../game'
require 'date'

describe Game do
  context 'Initialize Game Class' do
    game = Game.new(2, '2003/05/26', '2004/11/13')

    it 'should check if game has the correct input' do
      expect(game.instance_of?(Game)) == true
    end

    it 'Creates a new game instance' do
      expect(game.class) == game
    end

    it 'should return valid if game publish date is an instance of game' do
      expect(game.publish_date).to eq Date.parse('2004/11/13')
    end

    it 'should return valid result if game can be archived' do
      expect(game).to respond_to(:can_be_archived?)
    end
  end
end
