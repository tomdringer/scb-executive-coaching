class AddPositionToSections < ActiveRecord::Migration[7.1]
  def change
    add_column :sections, :position, :integer
  end
end
