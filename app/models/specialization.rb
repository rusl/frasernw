class Specialization < ActiveRecord::Base
  attr_accessible :name
  has_paper_trail
  
  has_many :specialists
  has_many :clinics
  has_many :procedures
end
