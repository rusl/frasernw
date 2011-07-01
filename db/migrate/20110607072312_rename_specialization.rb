class RenameSpecialization < ActiveRecord::Migration
  def change
    rename_column :specialists, :specialty_id, :specialization_id
  end
end