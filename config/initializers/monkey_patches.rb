class Version
  
  def evented
    self.event.gsub('update','updated').gsub('destroy','destroyed').gsub('create','created')
  end
  
end