# encoding: utf-8
require File.expand_path('../lib/atlassian_upm/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name    = 'atlassian_upm'
  gem.version = UPM::VERSION
  gem.date    = Date.today.to_s

  gem.summary = "Atlassian_UPM is an interface to Atlassian UPM REST"
  gem.description = "Atlassian_UPM provides an interface to the Atlassian Universal Plugin Manager"

  gem.authors  = ['KinWah Lai, Bas Vodde']
  gem.email    = ['kinwah@odd-e.com', 'basv@odd-e.com']
  gem.homepage = 'https://github.com/kinwahlai/attempt_to'

  gem.add_dependency('rake')
  gem.add_development_dependency('rest_client', ['~> 1.7.3'])

  gem.files = `git ls-files -- {.,test,spec,lib}/*`.split("\n")
end
