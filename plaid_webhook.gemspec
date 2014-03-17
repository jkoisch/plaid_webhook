$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "plaid_webhook/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "plaid_webhook"
  s.version     = "0.1.0"
  s.authors     = "John Koisch"
  s.email       = "jk@cloudsway.com"
  s.homepage    = "https://github.com/jkoisch/plaid_webhook"
  s.summary     = "Creates a webhook endpoint for you to use with your Plaid integration"
  s.description = "An endpoint to define with your Plaid integration to receive updates about transactions and
account information"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.3"

  s.add_development_dependency "pg"
end
