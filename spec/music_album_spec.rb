require_relative '../musicalbum'
describe MusicAlbum do
  describe 'Initialize music album' do
    before(:each) do
      @musicalbum = MusicAlbum.new('2022-03/24', true)
    end
    it 'creates a new music album' do
      expect(@musicalbum).to be_an_instance_of MusicAlbum
    end
    it 'Music album is on spotify' do
      expect(@musicalbum.on_spotify).to be true
    end
    it 'Music album has method can_be_archived?' do
      expect(@musicalbum).to respond_to(:can_be_archived?)
    end
  end
end
