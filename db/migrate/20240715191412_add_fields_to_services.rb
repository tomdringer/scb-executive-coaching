class AddFieldsToServices < ActiveRecord::Migration[7.1]
  def change
    add_column :services, :title_colour, :string
    add_column :services, :title_size, :string
    add_column :services, :body_text_colour, :string
    add_column :services, :body_text_size, :string
    add_column :services, :link_colour, :string
    add_column :services, :hide_title, :boolean
    add_column :services, :background_colour, :string
  end
end
