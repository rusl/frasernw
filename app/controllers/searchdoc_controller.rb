class SearchdocController < ApplicationController
def tree
  @specializations = Specialization.find(:all, :include => [:specialists, :clinics])
  respond_to do |format|
    format.js
  end  
end

def index
  @specializations = Specialization.find(:all, :include => [:specialists, :clinics])
  respond_to do |format|
    format.js
  end  
end

end