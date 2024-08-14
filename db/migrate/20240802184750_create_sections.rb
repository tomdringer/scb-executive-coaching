class CreateSections < ActiveRecord::Migration[7.1]
  def change
    create_table :sections do |t|
      t.string :title_colour
      t.string :title_size
      t.string :body_text_colour
      t.string :body_text_size
      t.string :link_colour
      t.boolean :hide_title
      t.string :background_colour
      t.timestamps
    end
  end
end