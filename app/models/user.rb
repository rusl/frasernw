class User < ActiveRecord::Base
  acts_as_authentic
  has_many :favorites
  has_many :specialists, :through => :favorites
  # has_many :clinics,     :through => :favorites
  def admin?
    role == 'admin'
  end
end
