class AddCategoryIdToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :category_id, :integer
    add_foreign_key :blogs, :categories
  end
end
