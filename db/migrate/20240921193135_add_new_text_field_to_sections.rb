class AddNewTextFieldToSections < ActiveRecord::Migration[7.1]
  def change
    add_column :sections, :body, :text
  end
end
