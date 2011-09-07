class RenameMoaEntries < ActiveRecord::Migration
  def change
    rename_column :specialists, :moa_email, :contact_email
    rename_column :specialists, :moa_phone, :contact_phone
    rename_column :specialists, :moa_name, :contact_name
  end
end
# 
# t.string   "moa_name"
# t.string   "moa_phone"
# t.string   "moa_email"