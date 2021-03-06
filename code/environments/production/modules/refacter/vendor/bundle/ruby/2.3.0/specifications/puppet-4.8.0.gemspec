# -*- encoding: utf-8 -*-
# stub: puppet 4.8.0 ruby lib

Gem::Specification.new do |s|
  s.name = "puppet"
  s.version = "4.8.0"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Puppet Labs"]
  s.date = "2016-11-02"
  s.description = "Puppet, an automated configuration management tool"
  s.email = "info@puppetlabs.com"
  s.executables = ["puppet"]
  s.files = ["bin/puppet"]
  s.homepage = "https://github.com/puppetlabs/puppet"
  s.rdoc_options = ["--title", "Puppet - Configuration Management", "--main", "README.md", "--line-numbers"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.rubyforge_project = "puppet"
  s.rubygems_version = "2.5.1"
  s.summary = "Puppet, an automated configuration management tool"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<facter>, ["< 4", "> 2.0"])
      s.add_runtime_dependency(%q<hiera>, ["< 4", ">= 2.0"])
      s.add_runtime_dependency(%q<json_pure>, ["~> 1.8"])
    else
      s.add_dependency(%q<facter>, ["< 4", "> 2.0"])
      s.add_dependency(%q<hiera>, ["< 4", ">= 2.0"])
      s.add_dependency(%q<json_pure>, ["~> 1.8"])
    end
  else
    s.add_dependency(%q<facter>, ["< 4", "> 2.0"])
    s.add_dependency(%q<hiera>, ["< 4", ">= 2.0"])
    s.add_dependency(%q<json_pure>, ["~> 1.8"])
  end
end
