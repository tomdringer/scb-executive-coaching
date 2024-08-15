class AddDescriptionToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :description, :text
  end
end
