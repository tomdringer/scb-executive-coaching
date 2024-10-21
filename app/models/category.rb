class Category < ApplicationRecord
  belongs_to :blog
  has_many :blogs_categories
  has_many :blogs, through: :blogs_categories
  validates :name, presence: true, uniqueness: true
end