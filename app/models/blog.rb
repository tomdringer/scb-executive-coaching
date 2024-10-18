class Blog < ApplicationRecord
  has_many :blogs_categories
  has_many :categories, through: :blogs_categories
  accepts_nested_attributes_for :blogs_categories, allow_destroy: true
  has_one_attached :preview
end
