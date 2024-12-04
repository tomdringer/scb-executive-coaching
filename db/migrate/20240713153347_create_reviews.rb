class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    unless table_exists?(:reviews)
      create_table :reviews do |t|
        t.string :title
        t.text :body
        t.string :author

        t.timestamps
      end
    end
  end
end
