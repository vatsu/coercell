# -*- encoding: utf-8 -*-
require File.expand_path('../lib/parser_xcel/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Rafael Barros"]
  gem.email         = ["rafael.barros@jazz.etc.br"]
  gem.description   = %q{A parser xls/xlsx/cvs validating with model}
  gem.summary       = %q{}
  gem.homepage      = ""

  gem.add_dependency("roo", ["~> 1.10.3"])

  gem.files         = Dir['Rakefile', '{lib}/**/*', 'README', 'LICENSE']

  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "parser_xcel"
  gem.require_paths = ["lib"]
  gem.version       = ParserXcel::VERSION
  gem.date = Date.today.to_s
end
