class AddContactNotes < ActiveRecord::Migration
  def change
    add_column :specialists, :contact_notes, :string
  end
end