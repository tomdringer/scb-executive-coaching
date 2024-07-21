class Service < ApplicationRecord
  has_rich_text :body
  has_one_attached :photo_one
  has_one_attached :photo_two
end