class Privilege < ActiveRecord::Base
  belongs_to :specialist
  belongs_to :hospital
end
