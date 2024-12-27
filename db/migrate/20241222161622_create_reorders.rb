class CreateReorders < ActiveRecord::Migration[7.0]
  def change
    create_table :reorders do |t|
      t.integer :item_id, null: false  # Reference to the section/item being reordered
      t.integer :position, null: false # Position/ordering of the item
      t.timestamps # Automatically adds created_at and updated_at
    end
  end
end