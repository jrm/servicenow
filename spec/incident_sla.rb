require 'spec_helper'

class Array; def sum; inject(0) {|acc,i| acc += i}; end; def mean; sum.to_f / size; end; end

class String
  def to_seconds
    hours, minutes, seconds = split(":").map{|str| str.to_i}  
    hours * 3600 + minutes * 60 + seconds
  rescue
    -1  
  end
end


describe Servicenow::IncidentSLA do
  
  before :each do
  end
    
  describe ".get_slas" do
    it "returns a record" do
      priority_response_sla_map = {
        1 => "9d858230dd45e5002d0c1fb7120f3de0",
        2 => "0275827cdd05e5002d0c1fb7120f3d28",
        3 => "8b55c2fcdd05e5002d0c1fb7120f3d54",
        4 => "74450a3cdd05e5002d0c1fb7120f3dd0",
        5 => "6025c2bcdd05e5002d0c1fb7120f3da0"
      }
      slas = Servicenow::IncidentSLA.aggregate({"__encoded_query"=>"inc_assignment_groupIN78d6cb6b9d8391405389e3215c64f7cf,b7ee5626395465000f15d981036cb665,4c6469ea9daed1005389e3215c64f715,fb5ba51ce0945500839bce92d3ab7647,5fff0b19752149400749e176618f11d1,25f7d68dc58ab0000749b1932ccdd3dc,2df7d68dc58ab0000749b1932ccdd3de,21f7d68dc58ab0000749b1932ccdd3e0,29f7d68dc58ab0000749b1932ccdd3dd,15f7d68dc58ab0000749b1932ccdd3d0,91f7d68dc58ab0000749b1932ccdd3ce,2d30d5f9c5f2f8000749b1932ccdd3c2,11f7d68dc58ab0000749b1932ccdd3cc,cff402ddc59a74000749b1932ccdd356,95f7d68dc58ab0000749b1932ccdd3d2,19f7d68dc58ab0000749b1932ccdd3d4,99f7d68dc58ab0000749b1932ccdd3d6,2df7d68dc58ab0000749b1932ccdd3d8,116e31cc7595c9000749e176618f112e,fbbfd2ab503dcd005351367ffb406d9e,37a92a2c2b2f89005351c6ec17da1559,3d3722682b2f89005351c6ec17da1588^inc_opened_atRELATIVEGE@hour@ago@24", "GROUP_BY" => ["inc_priority", "taskslatable_sla"], :avg => "taskslatable_duration", :min => "taskslatable_duration", :max => "taskslatable_duration"})
      times = slas.collect do |sla|
        next unless priority_response_sla_map[sla[:inc_priority].to_i] == sla[:taskslatable_sla]
        sla
      end.compact
      puts times.collect {|t| t[:avg].strftime("%H:%M:%S").to_seconds}.mean
      puts times.collect {|t| t[:min].strftime("%H:%M:%S").to_seconds}.mean
      puts times.collect {|t| t[:max].strftime("%H:%M:%S").to_seconds}.mean
      
      puts times.inspect
      #slas = Servicenow::IncidentSLA.aggregate({"__encoded_query"=>"inc_assignment_groupIN78d6cb6b9d8391405389e3215c64f7cf,b7ee5626395465000f15d981036cb665,4c6469ea9daed1005389e3215c64f715,fb5ba51ce0945500839bce92d3ab7647,5fff0b19752149400749e176618f11d1,25f7d68dc58ab0000749b1932ccdd3dc,2df7d68dc58ab0000749b1932ccdd3de,21f7d68dc58ab0000749b1932ccdd3e0,29f7d68dc58ab0000749b1932ccdd3dd,15f7d68dc58ab0000749b1932ccdd3d0,91f7d68dc58ab0000749b1932ccdd3ce,2d30d5f9c5f2f8000749b1932ccdd3c2,11f7d68dc58ab0000749b1932ccdd3cc,cff402ddc59a74000749b1932ccdd356,95f7d68dc58ab0000749b1932ccdd3d2,19f7d68dc58ab0000749b1932ccdd3d4,99f7d68dc58ab0000749b1932ccdd3d6,2df7d68dc58ab0000749b1932ccdd3d8,116e31cc7595c9000749e176618f112e,fbbfd2ab503dcd005351367ffb406d9e,37a92a2c2b2f89005351c6ec17da1559,3d3722682b2f89005351c6ec17da1588^inc_stateIN1,2,8", "GROUP_BY" => ["inc_priority", "taskslatable_has_breached"], :count => "inc_number"})
      slas.should be_an_instance_of Array
      #record  = Servicenow::IncidentSLA.get_record(:inc_number => "INC1234408")
      #puts record.to_yaml
      
    end
  end
  
end