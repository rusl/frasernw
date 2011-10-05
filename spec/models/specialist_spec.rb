require File.dirname(__FILE__) + '/../spec_helper'

describe Specialist do
  before :each do
    @specialist = Specialist.new(
      firstname: 'joe',
      lastname: 'blow',
      specialization: mock_model("Specialization")
    )
  end

  it "should be valid with specialization and name" do
    @specialist.should be_valid
  end

  it "should have an investigation for each procedure" do
    # Specialist.potential
  end

end
