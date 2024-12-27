class Reorder < ApplicationRecord
  validates :position, presence: true
  validates :position, numericality: { only_integer: true, greater_than: 0 }

  private
  def set_default_position
    # Defaults to the next highest position
    self.position = (Section.maximum(:position) || 0) + 1
  end
end