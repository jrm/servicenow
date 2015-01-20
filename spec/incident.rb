require 'spec_helper'

TEST_RECORD_NUMBER  = "INC1085988"

class Array; def sum; inject(0) {|acc,i| acc += i}; end; def mean; sum.to_f / size; end; end

describe Servicenow::Incident do
  
  before :each do
    @random_string = [*('A'..'Z')].sample(8).join
    #@test_record = Servicenow::Incident.get_record(:number => TEST_RECORD_NUMBER)
  end
  
  describe ".get_record" do
    it "returns a record" do
      record = Servicenow::Incident.get_record(:number => TEST_RECORD_NUMBER)
      #puts record.inspect
      expect(record).to be_an_instance_of(Servicenow::Incident)
    end
  end
    
  #describe ".get_records" do
  #  it "returns an array of records" do
      #records = Servicenow::Incident.count_records({"__encoded_query"=>"assignment_group=78d6cb6b9d8391405389e3215c64f7cf^ORassignment_group=b7ee5626395465000f15d981036cb665^ORassignment_group=4c6469ea9daed1005389e3215c64f715^ORassignment_group=fb5ba51ce0945500839bce92d3ab7647^ORassignment_group=5fff0b19752149400749e176618f11d1^ORassignment_group=25f7d68dc58ab0000749b1932ccdd3dc^ORassignment_group=2df7d68dc58ab0000749b1932ccdd3de^ORassignment_group=21f7d68dc58ab0000749b1932ccdd3e0^ORassignment_group=29f7d68dc58ab0000749b1932ccdd3dd^ORassignment_group=15f7d68dc58ab0000749b1932ccdd3d0^ORassignment_group=91f7d68dc58ab0000749b1932ccdd3ce^ORassignment_group=2d30d5f9c5f2f8000749b1932ccdd3c2^ORassignment_group=11f7d68dc58ab0000749b1932ccdd3cc^ORassignment_group=cff402ddc59a74000749b1932ccdd356^ORassignment_group=95f7d68dc58ab0000749b1932ccdd3d2^ORassignment_group=19f7d68dc58ab0000749b1932ccdd3d4^ORassignment_group=99f7d68dc58ab0000749b1932ccdd3d6^ORassignment_group=2df7d68dc58ab0000749b1932ccdd3d8^ORassignment_group=116e31cc7595c9000749e176618f112e^ORassignment_group=fbbfd2ab503dcd005351367ffb406d9e^ORassignment_group=37a92a2c2b2f89005351c6ec17da1559^ORassignment_group=3d3722682b2f89005351c6ec17da1588^resolved_atRELATIVEGE@hour@ago@24^business_stc<14400^priority=3"})
      #INC0267797
      #records = Servicenow::Incident.get_records({"__encoded_query"=>"assignment_group=78d6cb6b9d8391405389e3215c64f7cf^ORassignment_group=b7ee5626395465000f15d981036cb665^ORassignment_group=4c6469ea9daed1005389e3215c64f715^ORassignment_group=fb5ba51ce0945500839bce92d3ab7647^ORassignment_group=5fff0b19752149400749e176618f11d1^ORassignment_group=25f7d68dc58ab0000749b1932ccdd3dc^ORassignment_group=2df7d68dc58ab0000749b1932ccdd3de^ORassignment_group=21f7d68dc58ab0000749b1932ccdd3e0^ORassignment_group=29f7d68dc58ab0000749b1932ccdd3dd^ORassignment_group=15f7d68dc58ab0000749b1932ccdd3d0^ORassignment_group=91f7d68dc58ab0000749b1932ccdd3ce^ORassignment_group=2d30d5f9c5f2f8000749b1932ccdd3c2^ORassignment_group=11f7d68dc58ab0000749b1932ccdd3cc^ORassignment_group=cff402ddc59a74000749b1932ccdd356^ORassignment_group=95f7d68dc58ab0000749b1932ccdd3d2^ORassignment_group=19f7d68dc58ab0000749b1932ccdd3d4^ORassignment_group=99f7d68dc58ab0000749b1932ccdd3d6^ORassignment_group=2df7d68dc58ab0000749b1932ccdd3d8^ORassignment_group=116e31cc7595c9000749e176618f112e^ORassignment_group=fbbfd2ab503dcd005351367ffb406d9e^ORassignment_group=37a92a2c2b2f89005351c6ec17da1559^ORassignment_group=3d3722682b2f89005351c6ec17da1588^stateIN1,2,8", "__limit" => 100000})
      #puts records.inspect
      #records.each do |r|
      #  h = (Time.now.utc.to_i - Time.parse(r.opened_at).to_i) / 3600
      #  puts "#{r.opened_at} : #{h}"
      #end
      #records.should be_an_instance_of Array
      
      #grouped_samples = records.group_by do |s|
      #  t = Time.parse(s[:opened_at]).to_i
      #  Time.at(t - (t % (5 * 60))).to_i
      #end.inject({}) {|acc,i| acc.merge!({Time.at(i[0]) => i[1].collect {|j| j[:count].to_i}.sum })}
      #puts grouped_samples.inspect
      
      
      
      #grouped_incidents = Hash.new{|hash,key| hash[key] = Hash.new{|h,k| h[k] = 0}}
      
      #records.each do |r|
      #  grouped_incidents[r[:priority]][r[:assignment_group]] ?
      #    grouped_incidents[r[:priority]][r[:assignment_group]] += r[:count].to_i :
      #    grouped_incidents[r[:priority]][r[:assignment_group]] = r[:count].to_i
      #end
      
      #puts grouped_incidents.inspect
      
      #records = records.group_by {|i|
      #  Time.parse(i[:opened_at]).to_date
      #}.inject({}) {|acc,i| acc.merge!({i[0] => i[1].size}) }
      
      #records.each do |k,v|
      #  puts "#{k.to_time.to_i} : #{v}"
      #end
      #puts records.inspect
  #  end
  #end
  
  #describe ".insert" do
  #  it "creates an Incident" do
  #    record = Servicenow::Incident.insert({"description" => "#{@random_string}"})
  #    record.description.to_s.should eq @random_string
  #  end    
  #end
  
  #describe ".update" do
  #  it "updates an Incident" do
  #    Servicenow::Incident.update(@test_record.sys_id,{"description" => "#{@random_string}"}).description.to_s.should eq @random_string
  #  end
  #end
  
  #describe "#formatted" do
  #  it "returns a formatted Incident" do
  #    Servicenow::Incident.get(@test_record.sys_id).formatted.should match(/Number: #{TEST_RECORD_NUMBER}/)
  #  end
  #end
  

end