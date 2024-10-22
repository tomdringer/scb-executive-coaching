class AddAuthorToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :author, :string
  end
end
