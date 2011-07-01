class CreateClinics < ActiveRecord::Migration
  def self.up
    create_table :clinics do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :postalcode
      t.string :city
      t.string :province
      t.string :phone1
      t.string :fax
      t.text :status
      t.text :interest
      t.integer :waittime
      t.integer :specialization_id
      t.timestamps
    end
  end

  def self.down
    drop_table :clinics
  end
end
