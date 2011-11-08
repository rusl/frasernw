class Specialist < ActiveRecord::Base
    attr_accessible :firstname, :lastname, :address1, :address2, :postalcode, :city, :province, :phone1, :fax, :practise_limitations, :interest, :waittime, :specialization_id, :procedure_ids, :direct_phone, :red_flags, :clinic_ids, :responds_via, :contact_name, :contact_email, :contact_phone, :contact_notes, :referral_criteria, :status_mask, :location_opened, :referral_fax, :referral_phone, :referral_other_details, :urgent_fax, :urgent_phone, :urgent_other_details, :respond_by_fax, :respond_by_phone, :respond_by_mail, :respond_to_patient, :status_details, :required_investigations, :not_performed, :lagtime, :patient_can_book, :lag_uom, :wait_uom, :referral_form, :hospital_ids, :capacities_attributes, :offices_attributes
    has_paper_trail ignore: :saved_token
    
    belongs_to :specialization
    
    # specialists have the capacity to perform procedures
    has_many   :capacities
    has_many   :procedures, :through => :capacities
    accepts_nested_attributes_for :capacities, :reject_if => lambda { |a| a[:procedure_id].blank? }, :allow_destroy => true
    
    # specialists attend clinics
    has_many   :attendances
    has_many   :clinics, :through => :attendances
    
    # specialists have "priviliges" at hospitals
    has_many   :privileges
    has_many   :hospitals, :through => :privileges
    
    # specialists are favorited by users of the system
    has_many   :favorites
    has_many   :users, :through => :favorites
    
    # has many contacts - dates and times they were contacted
    has_many  :contacts
    
    # dates and times they looked at and changed their own record
    has_many  :views
    has_many  :edits
    
    has_many :offices
    accepts_nested_attributes_for :offices
    
    validates_presence_of :firstname, :on => :save, :message => "can't be blank"
    validates_presence_of :lastname, :on => :save, :message => "can't be blank"
    validates_presence_of :specialization_id, :on => :save, :message => "can't be blank"
    
    after_initialize :default_values
    
    default_scope order('lastname, firstname')
    
    STATUS_HASH = { 1 => "Accepting new patients", 2 => "Only doing follow up on previous patients", 3 => "Semi-retired", 4 => "Retired"}
    
    def status
        Specialist::STATUS_HASH[status_mask]
    end
    
    def name
        firstname + ' ' + lastname
    end
    
    def address
        address = ''
        address += self.address1 || ''
        address += self.address2 || ''
        address
    end
    
    def lagtime_with_units
        self.lagtime.presence ? self.lagtime + " " + self.lag_uom : "unspecified"
    end
    
    def waittime_with_units
        self.waittime.presence ? self.waittime + " " + self.wait_uom : "unspecified"
    end
    
    def token
        if self.saved_token
            return self.saved_token
        else
            self.saved_token = SecureRandom.hex(16)
            self.save
            return self.saved_token
        end
    end
    
    def practice_limitations
        return practise_limitations
    end
    
    def accepts_referrals_via
        if referral_phone and referral_fax and referral_other_details.presence
            return "phone, fax, or " + referral_other_details
        elsif referral_phone and referral_fax
            return "phone or fax"
        elsif referral_phone
            output = "phone"
            if referral_other_details.presence
                return output + " or " + referral_other_details
            end
        elsif referral_fax
            output = "fax"
            if referral_other_details.presence
                return output + " or " + referral_other_details
            end
        elsif referral_other_details.presence
            return referral_other_details
        else
            return "unspecified"
        end
    end
    
    def responds_via
        if (not respond_by_phone) and (not respond_by_fax) and (not respond_by_mail) and (not respond_to_patient)
            return "unspecified"
        elsif (not respond_by_phone) and (not respond_by_fax) and (not respond_by_mail) and respond_to_patient
            return "directly to patient"
        else
            if respond_by_phone and respond_by_fax and respond_by_mail
                output = "phone, fax, or mail to referring office"
            elsif respond_by_phone and respond_by_fax and (not respond_by_mail)
                output = "phone or fax to referring office"
            elsif respond_by_phone and (not respond_by_fax) and respond_by_mail
                output = "phone or mail to referring office"
            elsif respond_by_phone and (not respond_by_fax) and (not respond_by_mail)
                output = "phone to referring office"
            elsif (not respond_by_phone) and respond_by_fax and respond_by_mail
                output = "fax or mail to referring office"
            elsif (not respond_by_phone) and respond_by_fax and (not respond_by_mail)
                output = "fax to referring office"
            else # must be (not respond_by_phone) and (not respond_by_fax) and respond_by_mail
                output = "mail to referring office"
            end
            
            if respond_to_patient
                return output + " (and directly to patient)"
            else
                return output
            end
        end
    end
    
    def urgent_referrals_via
        if urgent_phone and urgent_fax and urgent_other_details.presence
            return "phone, fax, or " + urgent_other_details
        elsif urgent_phone and urgent_fax
            return "phone or fax"
        elsif urgent_phone
            output = "phone"
            if urgent_other_details.presence
                return output + " or " + urgent_other_details
            end
        elsif urgent_fax
            output = "fax"
            if urgent_other_details.presence
                return output + " or " + urgent_other_details
            end
        elsif urgent_other_details.presence
            return referral_other_details
        else
            return "unspecified"
        end
    end
    
    private
    
    def default_values
        self.lag_uom ||= "weeks"
        self.wait_uom ||= "weeks"
    end
    
end
