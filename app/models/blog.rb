class Blog < ApplicationRecord
  has_one_attached :preview
  has_rich_text :body
end
