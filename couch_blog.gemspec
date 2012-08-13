$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "couch_blog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "couch_blog"
  s.version     = CouchBlog::VERSION
  s.authors     = ["Benjamin ter Kuile"]
  s.email       = ["bterkuile@gmail.com"]
  s.homepage    = "http://www.companytools.nl/"
  s.summary     = "Rails 3.2 Blog engine using SimplyStored as CouchDB orm"
  s.description = "Rails 3.2 Blog engine using SimplyStored as CouchDB orm as part of the CouchDB rails family of bterkuile"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2.6"
  # s.add_dependency "jquery-rails"

  #s.add_development_dependency "sqlite3"
end
