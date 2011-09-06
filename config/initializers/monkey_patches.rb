# securerandom for generating tokens with ruby 1.9
require 'securerandom'

# nice past tense events for paper_trail
class Version
  
  def evented
    self.event.gsub('update','updated').gsub('destroy','destroyed').gsub('create','created')
  end
  
end