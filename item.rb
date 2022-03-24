require 'date'
# frozen_string_literal: true

class Item
  attr_accessor :publish_date, :archived, :author, :source, :label, :genre
  attr_reader :id

  def initialize(publish_date, archived: true)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  # setter methods
  # rubocop:disable Lint/DuplicateMethods
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

    difference_in_days = (current - @publish_date).to_i
    (difference_in_days / 365.25) > 10
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
  end
  # rubocop:enable Lint/DuplicateMethods
end
