class AddPositionDefaultToSections < ActiveRecord::Migration[6.0]
  def change
    change_column_default :sections, :position, 1 # Default to 1
    change_column_null :sections, :position, false # Cannot be null
  end
end