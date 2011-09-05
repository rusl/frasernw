class AddReferralCriteriaToSpecialists < ActiveRecord::Migration
  def change
    add_column :specialists, :referral_criteria, :string
  end
end