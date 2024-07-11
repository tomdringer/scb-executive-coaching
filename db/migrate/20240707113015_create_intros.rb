class CreateIntros < ActiveRecord::Migration[7.1]
  def change
    create_table :intros do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
