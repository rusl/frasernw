class AddFieldsToSpecialists < ActiveRecord::Migration
  def change
    add_column :specialists, :not_interested, :text
    add_column :specialists, :all_procedure_info, :text
  end
end
