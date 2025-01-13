class Section < ApplicationRecord

  validates :body, presence: false
  validates :name, presence: true
  validates :background_colour, presence: true
  belongs_to :reorder
  acts_as_list scope: :reorder

  private
end
