class AddFocusesForClinics < ActiveRecord::Migration
  def up
    create_table :focuses, :force => true do |t|
      t.integer :clinic_id
      t.integer :procedure_id
      t.timestamps
    end
  end

  def down
    drop_table :focuses
  end
end