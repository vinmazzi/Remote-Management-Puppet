# -*- encoding: utf-8 -*-
# stub: puppetlabs_spec_helper 1.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "puppetlabs_spec_helper"
  s.version = "1.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Puppet, Inc.", "Community Contributors"]
  s.bindir = "exe"
  s.date = "2016-08-26"
  s.description = "Contains rake tasks and a standard spec_helper for running spec tests on puppet modules."
  s.email = ["modules-team@puppet.com"]
  s.homepage = "http://github.com/puppetlabs/puppetlabs_spec_helper"
  s.rubygems_version = "2.5.1"
  s.summary = "Standard tasks and configuration for module spec tests."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mocha>, ["~> 1.0"])
      s.add_runtime_dependency(%q<puppet-lint>, ["~> 2.0"])
      s.add_runtime_dependency(%q<puppet-syntax>, ["~> 2.0"])
      s.add_runtime_dependency(%q<rspec-puppet>, ["~> 2.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.12"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<puppet>, ["~> 3"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<mocha>, ["~> 1.0"])
      s.add_dependency(%q<puppet-lint>, ["~> 2.0"])
      s.add_dependency(%q<puppet-syntax>, ["~> 2.0"])
      s.add_dependency(%q<rspec-puppet>, ["~> 2.0"])
      s.add_dependency(%q<bundler>, ["~> 1.12"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<puppet>, ["~> 3"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<mocha>, ["~> 1.0"])
    s.add_dependency(%q<puppet-lint>, ["~> 2.0"])
    s.add_dependency(%q<puppet-syntax>, ["~> 2.0"])
    s.add_dependency(%q<rspec-puppet>, ["~> 2.0"])
    s.add_dependency(%q<bundler>, ["~> 1.12"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<puppet>, ["~> 3"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<yard>, [">= 0"])
  end
end
