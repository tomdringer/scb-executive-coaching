class AddFieldsToStories < ActiveRecord::Migration[7.1]
  def change
    add_column :stories, :title_colour, :string
    add_column :stories, :title_size, :string
    add_column :stories, :body_text_colour, :string
    add_column :stories, :body_text_size, :string
    add_column :stories, :link_colour, :string
    add_column :stories, :hide_title, :boolean
    add_column :stories, :background_colour, :string
  end
end
