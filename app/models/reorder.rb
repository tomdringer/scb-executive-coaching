class Reorder < ApplicationRecord
  acts_as_list
  validates :position, presence: true
  validates :position, numericality: { only_integer: true, greater_than: 0 }
  has_many :sections, -> { order(position: :asc) }, dependent: :destroy

  private
  def set_default_position
    # Defaults to the next highest position
    self.position = (Section.maximum(:position) || 0) + 1
  end
end
