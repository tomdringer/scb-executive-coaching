class Category < ApplicationRecord
  has_many :blog_categories
  has_many :blogs, through: :blog_categories
  validates :name, uniqueness: true
end