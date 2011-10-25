class AddReviewColumns < ActiveRecord::Migration
  def change
    add_column :versions,  :reviewed, :boolean, default: 1
  end
end
