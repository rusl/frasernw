class User < ActiveRecord::Base
  acts_as_authentic
  has_many :favorites
  has_many :specialists, :through => :favorites

  # times that the user (as admin) has contacted specialistscreate 
  has_many :contacts

  # has_many :clinics,     :through => :favorites
  validates_presence_of :name
  validates_presence_of :username
  validates_presence_of :email
  
  def admin?
    self.role == 'admin'
  end
end
