class Section < ApplicationRecord

  validates :body, presence: true
  validates :name, presence: true
  validates :background_colour, presence: true
  default_scope { order(:order) }

  private
end
