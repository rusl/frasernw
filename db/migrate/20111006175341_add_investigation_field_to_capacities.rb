class AddInvestigationFieldToCapacities < ActiveRecord::Migration
  def change
    add_column :capacities, :investigation, :string
    add_index :capacities, [:specialist_id, :procedure_id]
  end
end
