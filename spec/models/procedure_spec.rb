require File.dirname(__FILE__) + '/../spec_helper'

describe Procedure do
  it "should be valid" do
    Procedure.new.should be_valid
  end
end
