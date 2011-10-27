class Version < ActiveRecord::Base 
  attr_accessible :to_review

  # nice past tense events for paper_trail
  def evented
    self.event.gsub('update','updated').gsub('destroy','destroyed').gsub('create','created')
  end  
end
