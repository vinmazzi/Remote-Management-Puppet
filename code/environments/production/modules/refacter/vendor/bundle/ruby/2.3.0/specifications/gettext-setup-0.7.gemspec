# -*- encoding: utf-8 -*-
# stub: gettext-setup 0.7 ruby lib

Gem::Specification.new do |s|
  s.name = "gettext-setup"
  s.version = "0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Puppet"]
  s.date = "2016-09-13"
  s.description = "A gem to ease i18n"
  s.email = ["info@puppet.com"]
  s.homepage = "https://github.com/puppetlabs/gettext-setup-gem"
  s.licenses = ["Apache-2.0"]
  s.rubygems_version = "2.5.1"
  s.summary = "A gem to ease internationalization with fast_gettext"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<gettext>, [">= 3.0.2"])
      s.add_runtime_dependency(%q<fast_gettext>, ["~> 1.1.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rack-test>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.1"])
      s.add_development_dependency(%q<rspec-core>, ["~> 3.1"])
      s.add_development_dependency(%q<rspec-expectations>, ["~> 3.1"])
      s.add_development_dependency(%q<rspec-mocks>, ["~> 3.1"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<webmock>, [">= 0"])
    else
      s.add_dependency(%q<gettext>, [">= 3.0.2"])
      s.add_dependency(%q<fast_gettext>, ["~> 1.1.0"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rack-test>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3.1"])
      s.add_dependency(%q<rspec-core>, ["~> 3.1"])
      s.add_dependency(%q<rspec-expectations>, ["~> 3.1"])
      s.add_dependency(%q<rspec-mocks>, ["~> 3.1"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<webmock>, [">= 0"])
    end
  else
    s.add_dependency(%q<gettext>, [">= 3.0.2"])
    s.add_dependency(%q<fast_gettext>, ["~> 1.1.0"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rack-test>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3.1"])
    s.add_dependency(%q<rspec-core>, ["~> 3.1"])
    s.add_dependency(%q<rspec-expectations>, ["~> 3.1"])
    s.add_dependency(%q<rspec-mocks>, ["~> 3.1"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<webmock>, [">= 0"])
  end
end
