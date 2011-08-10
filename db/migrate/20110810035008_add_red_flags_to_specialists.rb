class AddRedFlagsToSpecialists < ActiveRecord::Migration
  def change
    add_column :specialists, :red_flags, :text
  end
end
