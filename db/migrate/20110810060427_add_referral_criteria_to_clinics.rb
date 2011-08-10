class AddReferralCriteriaToClinics < ActiveRecord::Migration
  def up
    add_column :clinics, :referral_criteria, :text
    add_column :clinics, :referral_process, :text
  end  
  def down
    remove_column :clinics, :referral_criteria
    remove_column :clinics, :referral_process
  end
end
