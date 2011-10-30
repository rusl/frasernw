class SearchdocController < ApplicationController
  skip_authorization_check

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