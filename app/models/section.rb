class Section < ApplicationRecord
  has_rich_text :body
  validates :name, presence: true
  validates :background_colour, presence: true

  default_scope { order(:order) }
end
