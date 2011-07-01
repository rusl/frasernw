class Procedure < ActiveRecord::Base
  attr_accessible :name, :specialization_id
  has_many :capacities
  has_many :specialists, :through => :capacities
  belongs_to :specialization
  
  default_scope :order => 'name ASC'
  
end
