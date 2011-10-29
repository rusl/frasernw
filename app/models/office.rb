class Office < ActiveRecord::Base
  belongs_to :specialist
  has_paper_trail
end
