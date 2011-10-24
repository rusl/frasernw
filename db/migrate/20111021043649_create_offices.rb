class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :address1
      t.string :address2
      t.string :postalcode
      t.string :city
      t.string :province
      t.string :phone1
      t.string :fax
      t.references :specialist
      t.timestamps
    end
    add_index :offices, :specialist_id
  end
end
