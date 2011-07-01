class Procedure < ActiveRecord::Base
  attr_accessible :name, :specialization_id
  has_many :capacities
  has_many :specialists, :through => :capacities
  belongs_to :specialization

  default_scope :order => 'name ASC'

  validates_presence_of :specialization_id, :on => :save, :message => "can't be blank"
  validates_presence_of :name, :on => :save, :message => "can't be blank"

end
