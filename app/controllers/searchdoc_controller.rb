class SearchdocController < ApplicationController
#caches_page :tree, :search_index
def tree
  # response.headers['Cache-Control'] = 'public, max-age=300'
  @specializations = Specialization.find(:all, :include => [:specialists, :clinics])
  respond_to do |format|
    format.js
  end  
end

def index
  # response.headers['Cache-Control'] = 'public, max-age=300'
  @specializations = Specialization.find(:all, :include => [:specialists, :clinics])
  respond_to do |format|
    format.js
  end  
end

end