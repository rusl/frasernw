class CreateInvestigations < ActiveRecord::Migration
  def change
    create_table :investigations do |t|
      t.string :details
      t.references :specialist
      t.references :procedure

      t.timestamps
    end
    
    add_index :investigations, [:specialist_id, :procedure_id]
  end
end
