class Capacity < ActiveRecord::Base
  belongs_to :specialist
  belongs_to :procedure
end
