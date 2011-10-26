class Specialization < ActiveRecord::Base
  attr_accessible :name
  has_paper_trail meta: { to_review: false }
  
  has_many :specialists
  has_many :clinics
  has_many :procedures

  default_scope order('name')

end
