require File.dirname(__FILE__) + '/../spec_helper'

describe Clinic do
  it "should be valid" do
    Clinic.new.should be_valid
  end
end
