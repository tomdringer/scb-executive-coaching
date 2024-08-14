class AddNameToSection < ActiveRecord::Migration[7.1]
  def change
    add_column :sections, :name, :string
  end
end
