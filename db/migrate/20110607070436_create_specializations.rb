class CreateSpecializations < ActiveRecord::Migration
  def self.up
    create_table :specializations do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :specializations
  end
end
