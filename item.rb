require 'date'
# frozen_string_literal: true

class Item
  attr_accessor :id, :publish_date, :archived
  attr_reader :genre, :label, :author

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  # rubocop:disable Lint/DuplicateMethods
  def genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def source(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  def label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end
  # rubocop:enable Lint/DuplicateMethods

  def can_be_archived?
    year = Time.now.year - @publish_date.year

    year > 10
  end
end
