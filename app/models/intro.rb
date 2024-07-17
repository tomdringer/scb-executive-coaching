class Intro < ApplicationRecord
  has_rich_text :body
  has_one_attached :photo_one
  has_one_attached :photo_two

  intro = Intro.first
  intro.to_global_id.to_s
  intro.to_signed_global_id.to_s
end
