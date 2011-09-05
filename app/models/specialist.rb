class Specialist < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :address1, :address2, :postalcode, :city, :province, :phone1, :fax, :status, :interest, :waittime, :specialization_id, :procedure_ids, :direct_phone, :red_flags, :clinic_ids, :responds_via
  has_paper_trail
  
  belongs_to :specialization

  # specialists have the capacity to perform procedures
  has_many   :capacities
  has_many   :procedures, :through => :capacities
  
  # specialists attend clinics
  has_many   :attendances
  has_many   :clinics, :through => :attendances
  
  # specialists have "priviliges" at hospitals
  has_many   :privileges
  has_many   :hospitals, :through => :privileges
  
  # specialists are favorited by users of the system
  has_many   :favorites
  has_many   :users, :through => :favorites
  
  validates_presence_of :firstname, :on => :save, :message => "can't be blank"
  validates_presence_of :lastname, :on => :save, :message => "can't be blank"
  validates_presence_of :specialization_id, :on => :save, :message => "can't be blank"
  
  default_scope order('lastname, firstname')  
  
  def name
    firstname + ' ' + lastname
  end

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
