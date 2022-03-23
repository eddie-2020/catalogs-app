class Genre
    attr_accessor :name
    attr_accessor :items

    @@items = []
    def initialize(name)
        @id = Random.rand(1..1000)
        @name = name
    end

    def add_item(item)
        @@items.push(item) unless @@items.include?(item)
        item.genre = self
    end
end