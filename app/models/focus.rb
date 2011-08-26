class Focus < ActiveRecord::Base
  belongs_to :clinic
  belongs_to :procedure
end
