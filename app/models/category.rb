class Category < ApplicationRecord
  has_many :blogs_categories
  has_many :blogs, through: :blogs_categories
  validates :name, presence: true, uniqueness: true
end