class AddOrderToSection < ActiveRecord::Migration[7.1]
  def change
    add_column :sections, :order, :integer
  end
end
