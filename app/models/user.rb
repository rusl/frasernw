class User < ActiveRecord::Base
  acts_as_authentic
  has_many :favorites
  has_many :specialists, :through => :favorites
  # has_many :clinics,     :through => :favorites
  validates_presence_of :name
  validates_presence_of :username
  validates_presence_of :email
  
  def admin?
    self.role == 'admin'
  end
end
