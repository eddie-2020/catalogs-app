require_relative '../author'

describe Author do
  context 'Initialize author class' do
    author = Author.new('Watt', 'Turner')

    it 'should check if author has the correct input' do
      expect(author.instance_of?(Author)) == true
    end

    it 'Creates a new game instance' do
      expect(author.class) == author
    end

    it 'should check if [first_name]: Watt and [last_name]: Turner ' do
      expect(author.first_name).to eq 'Watt'
      expect(author.last_name).to eq 'Turner'
    end

    it 'should check if author has a method called add item' do
      expect(author).to respond_to(:add_item)
    end
  end
end
