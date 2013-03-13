# -*- encoding: utf-8 -*-
require File.expand_path('../lib/parser_xcel/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Rafael Barros"]
  gem.email         = ["rafael.barros@jazz.etc.br"]
  gem.description   = %q{A parser xls/xlsx validating with model}
  gem.summary       = %q{}
  gem.homepage      = ""

  gem.add_development_dependency "roo"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "parser_xcel"
  gem.require_paths = ["lib"]
  gem.version       = ParserXcel::VERSION
end
