class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    unless table_exists?(:contacts)
      create_table :contacts do |t|
        t.string :first_name
        t.string :last_name
        t.string :email
        t.text :message

        t.timestamps
      end
    end
    end
end
