class Hospital < ActiveRecord::Base
  attr_accessible :name, :address1, :address2, :postalcode, :city, :province, :phone1, :fax
  has_paper_trail meta: { to_review: false }
  
  has_many :privileges
  has_many :specialists, :through => :privileges
  
  validates_presence_of :name, :on => :create, :message => "can't be blank"
end
