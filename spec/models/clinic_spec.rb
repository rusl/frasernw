require File.dirname(__FILE__) + '/../spec_helper'

describe Clinic do
  it "should not be valid without parameters" do
    Clinic.new.should_not be_valid
  end

  it "should not be valid without name" do
    Clinic.new(:specialization_id => Specialization.first).should_not be_valid
  end

  it "should be valid with specialization" do
    Clinic.new(:specialization_id => Specialization.first, :name => 'best clinic').should be_valid
  end
  
  
end
