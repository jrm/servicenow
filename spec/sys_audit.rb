require 'spec_helper'

#TEST_RECORD_NUMBER  = "deb9127e6f1cc10031412fa0be3ee40f"
#TEST_RECORD_NAME = "Companion Websites (CWs)"

describe Servicenow::SysAudit do
  
  before :each do
  end
    
  describe ".get_records" do
    it "returns records" do
      records = Servicenow::SysAudit.get_records({"documentkey" => "05f6e6710ff2a5009fb1da5bd2050eda", :fieldname => "assignment_group", :oldvalue => ''})
      records.each do |r|
        puts r.sys_id
        puts r.sys_created_on
      end
      puts records.inspect
      records.should be_an_instance_of Array
    end
  end
  
end