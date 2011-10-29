class AddSpecialistTimeUoMs < ActiveRecord::Migration
  def change
    change_table :specialists do |t|
      t.column :lag_uom, :string
      t.column :wait_uom, :string
    end
  end
end
