class AddFieldsToSections < ActiveRecord::Migration[7.1]
  def change
    add_column :sections, :title, :string
  end
end
