class Contact < ActiveRecord::Base
  belongs_to :specialist
  belongs_to :user
end
