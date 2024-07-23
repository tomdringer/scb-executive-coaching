class AddFieldsToIntros < ActiveRecord::Migration[7.1]
  def change
    add_column :intros, :title_colour, :string
    add_column :intros, :title_size, :string
    add_column :intros, :body_text_colour, :string
    add_column :intros, :body_text_size, :string
    add_column :intros, :link_colour, :string
    add_column :intros, :hide_title, :boolean
    add_column :intros, :background_colour, :string
  end
end
