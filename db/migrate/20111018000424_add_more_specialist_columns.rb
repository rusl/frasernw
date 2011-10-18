class AddMoreSpecialistColumns < ActiveRecord::Migration
  def change
    add_column :specialists, :referral_form, :boolean
    change_column :specialists, :lagtime, :string
    change_column :specialists, :waittime, :string
  end
end
