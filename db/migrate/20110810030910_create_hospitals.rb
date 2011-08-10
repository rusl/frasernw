class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :postalcode
      t.string :city
      t.string :province
      t.string :phone1
      t.string :fax
      t.timestamps
    end
  end
end
