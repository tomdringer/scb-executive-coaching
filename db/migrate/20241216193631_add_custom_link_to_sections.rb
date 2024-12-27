class AddCustomLinkToSections < ActiveRecord::Migration[7.1]
  def change
    add_column :sections, :custom_link, :string
  end
end
