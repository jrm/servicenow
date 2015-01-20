require 'spec_helper'

#TEST_RECORD_NUMBER  = "deb9127e6f1cc10031412fa0be3ee40f"
#TEST_RECORD_NAME = "Companion Websites (CWs)"

describe Servicenow::CmdbCiAppl do
  
  before :each do
  end
    
  describe ".get_records" do
    it "returns a record" do
      records = Servicenow::CmdbCiAppl.get("05b3345ac5b970000749b1932ccdd3cd")
      record.should be_an_instance_of Servicenow::CmdbCiAppl
    end
    
    #it "returns a record by name" do
    #  record = Servicenow::CmdbCiAppl.get_record({:name => TEST_RECORD_NAME})
    #  puts record
    #  record.should be_an_instance_of Servicenow::CmdbCiAppl
    #end
    
    
  end
  
end