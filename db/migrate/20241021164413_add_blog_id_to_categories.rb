class AddBlogIdToCategories < ActiveRecord::Migration[7.1]
  def change
    add_reference :categories, :blog, foreign_key: true
  end
end