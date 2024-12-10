class AddFileUploadToResources < ActiveRecord::Migration[7.1]
  def change
    add_column :resources, :file_upload, :string
  end
end
