class AddReferralCriteriaColumnsToSpecialist < ActiveRecord::Migration
  def change
    add_column :specialists, :referral_mechanism, :string
    add_column :specialists, :lagtime, :integer
    add_column :specialists, :referral_request, :string
    add_column :specialists, :patient_can_book, :boolean, :default => false
    add_column :specialists, :urgent_mechanism, :string
    add_column :specialists, :required_investigations, :text
    add_column :specialists, :not_performed, :text
  end
end
