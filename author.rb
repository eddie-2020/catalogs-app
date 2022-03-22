require './item'

class Author < Item
  attr_reader :publish_date, :archived

  def initialize(first_name, last_name, items)
    super
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = items
  end

  def add_item; end
end