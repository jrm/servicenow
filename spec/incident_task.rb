require 'spec_helper'

describe Servicenow::IncidentTask do
  
  before :each do
  end
    
  describe ".get_record" do
    it "returns a record" do
      record = Servicenow::IncidentTask.get_record(:number => "INCTSK0021631")
      expect(record).to be_an_instance_of(Servicenow::IncidentTask)
    end
  end
  
end