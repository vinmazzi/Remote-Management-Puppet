# -*- encoding: utf-8 -*-
# stub: puppet-blacksmith 3.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "puppet-blacksmith"
  s.version = "3.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["MaestroDev"]
  s.date = "2016-07-11"
  s.description = "Puppet module tools for development and Puppet Forge management"
  s.email = ["info@maestrodev.com"]
  s.homepage = "http://github.com/maestrodev/puppet-blacksmith"
  s.rubygems_version = "2.5.1"
  s.summary = "Tasks to manage Puppet module builds"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rest-client>, ["~> 1.8.0"])
      s.add_runtime_dependency(%q<puppet>, [">= 2.7.16"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<puppetlabs_spec_helper>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
      s.add_development_dependency(%q<aruba>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 3.0.0"])
      s.add_development_dependency(%q<webmock>, ["~> 1.23.0"])
    else
      s.add_dependency(%q<rest-client>, ["~> 1.8.0"])
      s.add_dependency(%q<puppet>, [">= 2.7.16"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<puppetlabs_spec_helper>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<aruba>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 3.0.0"])
      s.add_dependency(%q<webmock>, ["~> 1.23.0"])
    end
  else
    s.add_dependency(%q<rest-client>, ["~> 1.8.0"])
    s.add_dependency(%q<puppet>, [">= 2.7.16"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<puppetlabs_spec_helper>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<aruba>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 3.0.0"])
    s.add_dependency(%q<webmock>, ["~> 1.23.0"])
  end
end
