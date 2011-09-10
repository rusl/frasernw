class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.references :specialist
      t.text :notes
      t.timestamps
    end
    add_index :views, :specialist_id
  end
end