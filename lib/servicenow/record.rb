require "ostruct"
require "yaml"
module Servicenow
  class Record < OpenStruct
    
    class << self
       attr_accessor :soap_setup
       attr_accessor :instance
       attr_accessor :domain
       attr_accessor :table
       attr_accessor :wsdl
    end
    
    def self.setup_soap(user,password,instance, opts = {})
      extend Savon::Model
      include Servicenow::Operations
      domain = opts[:domain] || "service-now.com"
      log = opts[:log] || false
      self.wsdl = "https://%s:%s@%s.%s/%s.do?WSDL" % [user,password,instance,domain,table]
      client :wsdl => self.wsdl,
             :log => log ? true : false,
             :log_level => log || :fatal,
             :ssl_verify_mode => :none
      global :basic_auth, user,  password
      operations :get, :get_records, :get_keys, :insert, :update, :aggregate
      self.soap_setup = true
    end

    include Servicenow::CommonMethods

  end
end