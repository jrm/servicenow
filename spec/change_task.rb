require 'spec_helper'

describe Servicenow::ChangeTask do
  
  before :each do
  end
    
  describe ".get_record" do
    it "returns a record" do
      record = Servicenow::ChangeTask.get_record(:number => "CTASK0010602")
      expect(record).to be_an_instance_of(Servicenow::ChangeTask)
    end
  end
  
end