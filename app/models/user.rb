class User < ActiveRecord::Base
  acts_as_authentic
  has_many :favorites
  has_many :specialists, :through => :favorites
  # has_many :clinics,     :through => :favorites
  def admin?
    self.role == 'admin'
  end
end
