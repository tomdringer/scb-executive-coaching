class AddDescriptionToResources < ActiveRecord::Migration[7.1]
  def change
    add_column :resources, :description, :text
    add_column :resources, :author, :string
    add_column :resources, :category_id, :integer
  end
end
