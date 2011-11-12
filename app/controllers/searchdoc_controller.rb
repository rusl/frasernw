class SearchdocController < ApplicationController
skip_authorization_check
def navigation
  @specializations = Specialization.all
  @specialists = Specialist.all
  @clinics = Clinic.all
end
def tree
  @specializations = Specialization.includes(:specialists, :clinics, :procedures)
  respond_to do |format|
    format.js
    # format.xml { render :xml => @specializations }
    # format.xml { render :xml => @specializations }
  end  
end

def index
  @specializations = Specialization.includes(:specialists, :clinics, :procedures)
  respond_to do |format|
    format.js
  end  
end

end
