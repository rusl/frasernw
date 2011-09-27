class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :item_type, null: false
      t.integer :item_id,  null: false
      t.string :whodunnit
      t.text :object
      t.text :object_changes

      t.timestamps
    end
  end
end
