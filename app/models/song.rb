class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: {minimum: 1}
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true, length: {minimum: 1}

  with_options if: :released do |s| # not required, but if present, validates...
    s.validates :release_year, presence: true
    s.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  end
end
