class ChangeBlogIdToBeNullableInCategories < ActiveRecord::Migration[7.1]
  def change
    change_column_null :categories, :blog_id, true
  end
end