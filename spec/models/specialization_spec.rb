require File.dirname(__FILE__) + '/../spec_helper'

describe Specialization do
  it "should be valid" do
    Specialization.new.should be_valid
  end
end
