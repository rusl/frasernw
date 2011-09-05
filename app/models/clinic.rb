class Clinic < ActiveRecord::Base
  attr_accessible :name, :address1, :address2, :postalcode, :city, :province, :phone1, :fax, :status, :interest, :waittime, :specialization_id, :referral_criteria, :referral_process, :procedure_ids
  
  has_many :attendances
  has_many :specialists, :through => :attendances
  
  belongs_to :specialization
  
  validates_presence_of :specialization_id, :on => :create, :message => "can't be blank"
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  
  # specialists have the capacity to perform procedures
  has_many   :focuses
  has_many   :procedures, :through => :focuses
  
  def address
    address = ''
    address += self.address1 || ''
    address += self.address2 || ''
    address
  end
  
  def waittime_or_blank
    self.waittime.blank? ? "n/a" : self.waittime
  end
  
  def waittime?
    self.waittime.blank? ? 'muted' : ''
  end

end
