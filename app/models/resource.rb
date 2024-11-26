class Resource < ApplicationRecord
  has_many :resource_categories, dependent: :destroy
  has_many :categories, through: :resource_categories
  has_one_attached :preview

  accepts_nested_attributes_for :resource_categories, allow_destroy: true
end