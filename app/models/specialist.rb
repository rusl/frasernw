class Specialist < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :address1, :address2, :postalcode, :city, :province, :phone1, :fax, :status, :interest, :waittime, :specialization_id, :procedure_ids

  belongs_to :specialization

  has_many   :capacities
  has_many   :procedures, :through => :capacities

  has_many   :favorites
  has_many   :users, :through => :favorites
  
  validates_presence_of :firstname, :on => :save, :message => "can't be blank"
  validates_presence_of :lastname, :on => :save, :message => "can't be blank"
  validates_presence_of :specialization_id, :on => :save, :message => "can't be blank"
  
  def name
    firstname + ' ' + lastname
  end
end
