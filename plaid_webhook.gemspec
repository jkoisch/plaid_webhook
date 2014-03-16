$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "plaid_webhook/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "plaid_webhook"
  s.version     = PlaidWebhook::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of PlaidWebhook."
  s.description = "TODO: Description of PlaidWebhook."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.3"

  s.add_development_dependency "sqlite3"
end
