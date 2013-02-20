# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sales_engine/version'

Gem::Specification.new do |gem|
  gem.name          = "sales_engine"
  gem.version       = SalesEngine::VERSION
  gem.authors       = ["Blair Anderson","Aimee Maher"]
  gem.email         = ["blair81@gmail.com", "aimee@geekycheeks.com"]
  gem.description   = %q{Sales Engine is a gschool class project}
  gem.summary       = %q{Sales Engine is a gschool class project}
  gem.homepage      = "https://github.com/blairand/sales_engine"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
