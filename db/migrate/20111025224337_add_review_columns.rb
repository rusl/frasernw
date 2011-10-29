class AddReviewColumns < ActiveRecord::Migration
  def change
    add_column :versions,  :to_review, :boolean
  end
end
