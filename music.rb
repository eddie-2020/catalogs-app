class MusicAlbum < Item
    attr_accessor :on_spotify
    def initialize(on_spotify)
        @on_spotify = on_spotify
    end

    def can_be_archived?
        true if super && on_spotify
    end
end