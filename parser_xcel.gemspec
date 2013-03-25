$:.push File.expand_path("../lib", __FILE__)

require "parser_xcel/version"

Gem::Specification.new do |s|
  s.name        = "parser_xcel"
  s.version     = ParserXcel::VERSION
  s.authors     = ["Rafael Barros","Gustavo Sales"]
  s.email       = ["rafael.barros@jazz.etc.br","vatsu21@gmail.com"]
  s.homepage    = ""
  s.summary     = "A parser xls/xlsx/ods validating with model"
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "roo"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
