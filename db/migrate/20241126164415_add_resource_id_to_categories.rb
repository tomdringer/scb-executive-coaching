class AddResourceIdToCategories < ActiveRecord::Migration[7.1]
  def change
    add_reference :categories, :resource, foreign_key: true
  end
end