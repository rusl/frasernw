class Capacity < ActiveRecord::Base
  belongs_to :specialist
  belongs_to :procedure
  has_paper_trail

  delegate :name, to: :procedure, allow_nil: true
end
