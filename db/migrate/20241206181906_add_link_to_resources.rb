class AddLinkToResources < ActiveRecord::Migration[7.1]
  def change
    add_column :resources, :link, :string
  end
end
