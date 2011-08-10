class AddAttendancesTable < ActiveRecord::Migration
  def up
    create_table :attendances, :force => true do |t|
      t.integer :specialist_id
      t.integer :clinic_id
      t.timestamps
    end
  end

  def down
    drop_table :attendances
  end
end
