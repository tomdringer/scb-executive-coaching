class CreateCoachings < ActiveRecord::Migration[7.1]
  def change
    create_table :coachings do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
