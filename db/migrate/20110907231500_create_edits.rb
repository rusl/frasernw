class CreateEdits < ActiveRecord::Migration
  def change
    create_table :edits do |t|
      t.references :specialist
      t.text :notes
      t.timestamps
    end
    add_index :edits, :specialist_id
  end
end
