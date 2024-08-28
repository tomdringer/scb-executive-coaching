class Blog < ApplicationRecord
  belongs_to :category, optional: true
  has_one_attached :preview
  has_rich_text :body
end
