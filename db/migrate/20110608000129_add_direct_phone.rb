class AddDirectPhone < ActiveRecord::Migration
  def up
    add_column :specialists, :direct_phone, :string
  end

  def down
    remove_column :specialists, :direct_phone
  end
end