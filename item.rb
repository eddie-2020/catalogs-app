require 'date'
# frozen_string_literal: true

# rubocop: disable Style/OptionalBooleanParamete
class Item
  attr_accessor :publish_date, :archived
  attr_reader :id
  attr_accessor :author, :source, :label, :genre
  
  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
  end

  # setter methods
  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def source(source)
    @source = source
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def can_be_archived?
    current = Date.today
    current.year - @publish_date.year > 10
  end

  def move_to_archive
    # @archived = true if can_be_archived? == true
    if can_be_archived?
      @archived = true
    else
      @archived = false
    end
  end
end
# rubocop: enable Style/OptionalBooleanParamete