require File.dirname(__FILE__) + '/../spec_helper'

describe Procedure do
# WTF
  # it "should be not be valid without parameters" do
  #   Procedure.new.should_not be_valid
  # end

  it "should be valid with specialization_id and name" do
    Procedure.new(:specialization_id => Specialization.first, :name => 'best clinic').should be_valid
  end
end
