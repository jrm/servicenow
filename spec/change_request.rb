require 'spec_helper'

TEST_RECORD_NUMBER  = "CHG0057620"

describe Servicenow::ChangeRequest do
  
  before :each do
  end
    
  describe ".get_record" do
    it "returns a single Change Request" do
      #record  = Servicenow::ChangeRequest.get_record({"number" => TEST_RECORD_NUMBER})
      record  = Servicenow::ChangeRequest.get_record({"__encoded_query" => "closed_atRELATIVEGE@hour@ago@72^state=4^u_close_reason!=Change cancelled^number=#{TEST_RECORD_NUMBER}"})
      puts record.inspect
      puts record.state
      puts record.u_close_reason
      record.should be_an_instance_of Servicenow::ChangeRequest
    end    
    
  end

end