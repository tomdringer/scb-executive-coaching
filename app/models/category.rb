class Category < ApplicationRecord
  belongs_to :blog, optional: true
  has_many :blogs_categories
  has_many :blogs, through: :blogs_categories
  validates :name, uniqueness: true
end