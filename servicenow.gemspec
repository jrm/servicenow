# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'servicenow/version'

Gem::Specification.new do |spec|
  spec.name          = "servicenow"
  spec.version       = Servicenow::VERSION
  spec.authors       = ["jamemiln"]
  spec.email         = ["james.milner@pearson.com"]
  spec.description   = %q{Ruby Interface for Service-Now SOAP Webservice}
  spec.summary       = %q{Supports Incident, Problem and Change modules}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_runtime_dependency "savon"
  spec.add_runtime_dependency "curb"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
