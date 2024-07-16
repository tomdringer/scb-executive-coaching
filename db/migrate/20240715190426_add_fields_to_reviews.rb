class AddFieldsToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :title_colour, :string
    add_column :reviews, :title_size, :string
    add_column :reviews, :body_text_colour, :string
    add_column :reviews, :body_text_size, :string
    add_column :reviews, :link_colour, :string
    add_column :reviews, :hide_title, :boolean
    add_column :reviews, :background_colour, :string
  end
end
