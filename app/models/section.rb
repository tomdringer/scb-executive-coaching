class Section < ApplicationRecord
  validates :body, presence: true
  validates :name, presence: true
  validates :background_colour, presence: true

  has_rich_text :body

  default_scope { order(:order) }
end
