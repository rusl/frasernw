class Investigation < ActiveRecord::Base
  belongs_to :specialist
  belongs_to :procedure

  delegate :name, to: :procedure, allow_nil: true
end
