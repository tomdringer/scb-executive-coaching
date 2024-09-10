class AddReviewsToSection < ActiveRecord::Migration[7.1]
  def change
    add_column :sections, :reviews, :boolean
  end
end
