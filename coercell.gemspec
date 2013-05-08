$:.push File.expand_path("../lib", __FILE__)

require "coercell/version"

Gem::Specification.new do |s|
  s.name        = "coercell"
  s.version     = Coercell::VERSION
  s.authors     = ["Rafael Barros","Gustavo Sales"]
  s.email       = ["rafael.barros@jazz.etc.br","vatsu21@gmail.com"]
  s.homepage    = "https://github.com/jzup/coercell"
  s.summary     = "A spreadsheet parser and importer to ActiveRecord models"
  s.description = <<-EOS
                      Parses spreadsheets, validates its data against ActiveRecord model 
                      and instanciates valid data
                  EOS

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "roo"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
