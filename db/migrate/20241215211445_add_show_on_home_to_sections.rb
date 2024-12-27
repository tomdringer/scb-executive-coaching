class AddShowOnHomeToSections < ActiveRecord::Migration[7.1]
  def change
    add_column :sections, :show_on_home, :boolean
  end
end
