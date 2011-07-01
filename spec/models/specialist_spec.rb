require File.dirname(__FILE__) + '/../spec_helper'


describe Specialist do

  it "should be valid with specialization and name" do
    Specialist.new(:specialization_id => Specialization.first, :firstname => 'joe', :lastname => 'blow').should be_valid
  end

end
