class Version < ActiveRecord::Base 
  attr_accessible :to_review
  scope :needs_review, where(to_review: true)

  # nice past tense events for paper_trail
  def evented
    self.event.gsub('update','updated').gsub('destroy','destroyed').gsub('create','created')
  end
end
