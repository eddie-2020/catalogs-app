require_relative './item'

class Book < Item
  attr_reader :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date, archived)
    super(publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    current = Date.today
    difference_in_days = (current - @publish_date).to_i

    (difference_in_days / 365.25) > 10 || @cover_state == 'bad'
  end
end
