class CreateSpecialists < ActiveRecord::Migration
  def self.up
    create_table :specialists do |t|
      t.string :firstname
      t.string :lastname
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
      t.integer :specialty_id
      t.timestamps
    end
  end

  def self.down
    drop_table :specialists
  end
end
