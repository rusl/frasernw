class AddPrivilegesTable < ActiveRecord::Migration
  def up
    create_table :privileges, :force => true do |t|
      t.integer :specialist_id
      t.integer :hospital_id
      t.timestamps
    end
  end

  def down
    drop_table :privileges
  end
end
