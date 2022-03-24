require_relative '../genre'
describe Genre do
    describe 'Initialize genre' do
        before(:each) do
            @genre = Genre.new('bluz')
        end
        it 'creates a new genre' do
            expect(@genre).to be_an_instance_of Genre
        end
        it 'Genre name is bluz' do
            expect(@genre.name).to eq('bluz')
        end
        it 'Genre has method add_item' do
            expect(@genre).to respond_to(:add_item)
        end
    end
end