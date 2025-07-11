class CreateBlogCategories < ActiveRecord::Migration[7.1]
  def change
    unless table_exists?(:blog_categories)
      create_table :blog_categories do |t|
        t.references :blog, null: false, foreign_key: true
        t.references :category, null: false, foreign_key: true

        t.timestamps
      end
    end
  end
end