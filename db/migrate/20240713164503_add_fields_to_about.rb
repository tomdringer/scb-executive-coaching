class AddFieldsToAbout < ActiveRecord::Migration[7.1]
  def change
    add_column :abouts, :title_colour, :string
    add_column :abouts, :title_size, :string
    add_column :abouts, :body_text_colour, :string
    add_column :abouts, :body_text_size, :string
    add_column :abouts, :link_colour, :string
    add_column :abouts, :hide_title, :boolean
    add_column :abouts, :background_colour, :string
  end
end
