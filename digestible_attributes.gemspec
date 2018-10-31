$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "digestible_attributes/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "digestible_attributes"
  s.version     = DigestibleAttributes::VERSION
  s.authors     = ["Anthony Hernandez"]
  s.email       = ["ant@antfeedr.com"]
  s.homepage    = "https://www.github.com/hernanat/digestible_attributes"
  s.summary     = "Rails plugin for generating and storing hash digests based on model attributes"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5.1"

  s.add_development_dependency "sqlite3", '~> 1.3.13'
  s.add_development_dependency "postgresql", '~> 1.0.0'
  s.add_development_dependency "rspec-rails", '~> 3.8.1'
end
