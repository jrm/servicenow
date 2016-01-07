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
      def cookies
        Servicenow.cookies
      end
      def store_cookies(response)
        Servicenow.cookies = response.http.cookies if response.http.cookies.any?
      end
    end
    
    def self.setup_soap(user,password,instance, opts = {})
      extend Savon::Model
      include Servicenow::Operations
      HTTPI.adapter = :curb
      domain = opts[:domain] || "service-now.com"
      log = opts[:log] || false
      display_value = opts[:display_value] || false
      if display_value
        self.wsdl = "https://%s:%s@%s.%s/%s.do?displayvalue=%s&WSDL" % [user,password,instance,domain,table,display_value]
      else
        self.wsdl = "https://%s:%s@%s.%s/%s.do?WSDL" % [user,password,instance,domain,table]
      end
      client :wsdl => self.wsdl,
             :log => log ? true : false,
             :log_level => log || :fatal,
             :ssl_verify_mode => :none,
             :ssl_version => :TLSv1
      operations :get, :get_records, :get_keys, :insert, :update, :aggregate
      global :basic_auth, user,  password
      self.soap_setup = true
    end

    include Servicenow::CommonMethods

  end
end