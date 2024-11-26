class AddAreaToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :area, :string
  end
end
