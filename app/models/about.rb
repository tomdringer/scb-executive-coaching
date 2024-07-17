class About < ApplicationRecord
  has_rich_text :body
  has_one_attached :photo_one
  has_one_attached :photo_two

  about = Intro.last
  about.to_global_id.to_s
  about.to_signed_global_id.to_s
end
