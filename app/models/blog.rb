class Blog < ApplicationRecord
  has_many :blog_categories, dependent: :destroy
  has_many :categories, through: :blog_categories
  has_one_attached :preview

  accepts_nested_attributes_for :blog_categories, allow_destroy: true
end