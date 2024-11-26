class CreateResources < ActiveRecord::Migration[7.1]
  def change
    create_table :resources do |t|
      t.string :title
      t.text :body
      t.string :category

      t.timestamps
    end
  end
end
