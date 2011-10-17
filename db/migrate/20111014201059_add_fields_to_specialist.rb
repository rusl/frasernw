class AddFieldsToSpecialist < ActiveRecord::Migration
  def change
    # Fields for Status
    add_column :specialists, :status_details, :string
    add_column :specialists, :location_opened, :string
    rename_column :specialists, :status, :practise_limitations
    add_column :specialists, :status_mask, :integer
    
    # Fields for Referrals
    add_column :specialists, :referral_fax, :boolean
    add_column :specialists, :referral_phone, :boolean
    rename_column :specialists, :referral_mechanism, :referral_other_details
    add_column :specialists, :respond_by_fax, :boolean
    add_column :specialists, :respond_by_phone, :boolean
    add_column :specialists, :respond_by_mail, :boolean
    add_column :specialists, :respond_to_patient, :boolean
    add_column :specialists, :urgent_fax, :boolean
    add_column :specialists, :urgent_phone, :boolean
    rename_column :specialists, :urgent_mechanism, :urgent_other_details
  end
end
