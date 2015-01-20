require 'spec_helper'

describe Servicenow::ProblemTask do
  
  before :each do
  end
    
  describe ".get_record" do
    it "returns a record" do
      record = Servicenow::ProblemTask.get_record(:number => "PTASK0010445")
      puts record.inspect
      puts record.state
      
      record.should be_an_instance_of Servicenow::ProblemTask
    end
  end
    
end