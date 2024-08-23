class AddAlignmentToSections < ActiveRecord::Migration[7.1]
  def change
    add_column :sections, :alignment, :text
  end
end
