require "servicenow/version"
require "servicenow/operations"
require "servicenow/common_methods"
require "servicenow/record"
require "servicenow/incident"
require "servicenow/problem"
require "servicenow/change_request"
require "servicenow/cmdb_ci_appl"

require 'savon'
require 'ostruct'


module Servicenow
  # Your code goes here...
  
  TICKETSTATES = {
    :new => 1,
    :assigned => 8,
    :work_in_progress => 2,
    :pending => -5,
    :resolved => 6,
    :closed => 7,
    :cancelled => 9
  }
  
end
