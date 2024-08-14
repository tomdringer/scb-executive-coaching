class AddHideInAMenuToSections < ActiveRecord::Migration[7.1]
  def change
    add_column :sections, :hide_menu, :boolean
  end
end
