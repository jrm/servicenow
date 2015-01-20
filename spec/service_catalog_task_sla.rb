require 'spec_helper'

describe Servicenow::ServiceCatalogTaskSLA do
  
  before :each do
  end
    
  describe ".get_record" do
    it "returns a record" do
      record = Servicenow::ServiceCatalogTaskSLA.get_record(:sct_number => "TASK0017579")
      puts record.inspect
      puts record.state
      
      record.should be_an_instance_of Servicenow::ServiceCatalogTask
    end
  end
  
  describe ".count_records" do
    it "counts records" do
      counts = Servicenow::ServiceCatalogTaskSLA.aggregate({"__encoded_query" => "sct_assignment_groupIN78d6cb6b9d8391405389e3215c64f7cf,b7ee5626395465000f15d981036cb665,4c6469ea9daed1005389e3215c64f715,fb5ba51ce0945500839bce92d3ab7647,5fff0b19752149400749e176618f11d1,25f7d68dc58ab0000749b1932ccdd3dc,2df7d68dc58ab0000749b1932ccdd3de,21f7d68dc58ab0000749b1932ccdd3e0,29f7d68dc58ab0000749b1932ccdd3dd,15f7d68dc58ab0000749b1932ccdd3d0,91f7d68dc58ab0000749b1932ccdd3ce,2d30d5f9c5f2f8000749b1932ccdd3c2,11f7d68dc58ab0000749b1932ccdd3cc,cff402ddc59a74000749b1932ccdd356,95f7d68dc58ab0000749b1932ccdd3d2,19f7d68dc58ab0000749b1932ccdd3d4,99f7d68dc58ab0000749b1932ccdd3d6,2df7d68dc58ab0000749b1932ccdd3d8,116e31cc7595c9000749e176618f112e,fbbfd2ab503dcd005351367ffb406d9e,37a92a2c2b2f89005351c6ec17da1559,3d3722682b2f89005351c6ec17da1588,de7e4f60c52889c00749b1932ccdd3c8", "GROUP_BY" => "sct_state", :count => "sct_number"})
      puts counts.inspect
      counts.should be_an_instance_of Array
    end
  end
  
  
end