class AddDefaultToPositionInSections < ActiveRecord::Migration[7.1]
  def change
    change_column_default :sections, :position, from: nil, to: 0
  end
end
