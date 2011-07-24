class AddMoaFields < ActiveRecord::Migration
  def up
    add_column :specialists, :moa_name, :string
    add_column :specialists, :moa_phone, :string
    add_column :specialists, :moa_email, :string
  end

  def down
  end
end