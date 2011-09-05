class AddRespondsViaToClinicsAndSpecialists < ActiveRecord::Migration
  def change
    add_column :clinics, :responds_via, :string
    add_column :specialists, :responds_via, :string
  end
end