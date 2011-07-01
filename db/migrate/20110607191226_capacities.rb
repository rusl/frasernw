class Capacities < ActiveRecord::Migration
  def up
    create_table :capacities, :force => true do |t|
      t.integer :specialist_id
      t.integer :procedure_id
      t.timestamps
    end
  end

  def down
    drop_table :capacities
  end
end