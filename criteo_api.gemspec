# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'criteo_api/version'

Gem::Specification.new do |spec|
  spec.name          = "criteo_api"
  spec.version       = CriteoApi::ApiConfig::CLIENT_LIB_VERSION
  spec.authors       = ["Junya Wako"]
  spec.email         = ["junwako@gmail.com"]

  spec.summary       = %q{Criteo API Client}
  spec.description   = %q{Criteo API Client}
  spec.homepage      = "https://github.com/f-scratch/criteo_api"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry-byebug"

  # spec.add_dependency 'shampoohat', '~> 0.0.1'
  spec.add_runtime_dependency "shampoohat", '~> 0.0.6'

end
