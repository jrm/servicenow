require_relative '../lib/servicenow.rb'
require 'pp'

RSpec.configure do |config|
  config.color = true
end

Servicenow::IncidentTask.setup_soap("solarwinds","***","pearsontest",{:display_value => false, :log => false})
Servicenow::ChangeTask.setup_soap("solarwinds","***","pearsontest",{:display_value => false, :log => false})
Servicenow::ProblemTask.setup_soap("solarwinds","***","pearson",{:display_value => true})