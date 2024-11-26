class CreateResourceCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :resource_categories do |t|
      t.references :resource, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end