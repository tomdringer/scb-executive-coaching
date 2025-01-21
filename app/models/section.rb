class Section < ApplicationRecord

  validates :body, presence: false
  validates :name, presence: true
  validates :background_colour, presence: true

end
