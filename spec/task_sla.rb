require 'spec_helper'

describe Servicenow::TaskSLA do
  
  before :each do
  end
    
  describe ".get_slas" do
    it "returns a record" do
      incident = Servicenow::Incident.get_record(:number => "INC1190663")
      slas = Servicenow::TaskSLA.get_records(:task => incident.sys_id)
      puts slas.inspect
      slas.should be_an_instance_of Array
    end
  end
  
end