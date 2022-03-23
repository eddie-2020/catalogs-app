require 'date'
# frozen_string_literal: true

# rubocop: disable Style/OptionalBooleanParamete
class Item
  attr_accessor :publish_date, :archived
  attr_reader :id
  attr_writer :author, :source, :label, :genre

  def initialize(publish_date, archived = false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  # setter methods
  def genre(genre)
    @genre = genre
  end

  def author(author)
    @author = author
  end

  def source(source)
    @source = source
  end

  def label(label)
    @label = label
  end

  def can_be_archived?
    current = Date.today

    difference_in_days = (current - @publish_date).to_i
    (difference_in_days / 365.25) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
  end
end
# rubocop: enable Style/OptionalBooleanParamete