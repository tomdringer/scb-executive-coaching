class RenameLitemIdToSectionIdInReorders < ActiveRecord::Migration[7.1]
  def change
    rename_column :reorders, :item_id, :section_id
  end
end
