class SavedToken < ActiveRecord::Migration
  def change
    add_column :specialists, :saved_token, :string
  end
end