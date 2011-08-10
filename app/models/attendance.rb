class Attendance < ActiveRecord::Base
  belongs_to :specialist
  belongs_to :clinic
end
