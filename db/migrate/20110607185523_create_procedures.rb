class CreateProcedures < ActiveRecord::Migration
  def self.up
    create_table :procedures do |t|
      t.string :name
      t.integer :specialization_id
      t.timestamps
    end
  end

  def self.down
    drop_table :procedures
  end
end
