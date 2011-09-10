class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :specialist
      t.references :user
      t.text       :notes
      t.timestamps
    end
    add_index :contacts, :specialist_id
    add_index :contacts, :user_id
  end
end
