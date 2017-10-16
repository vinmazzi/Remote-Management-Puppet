# -*- encoding: utf-8 -*-
# stub: rubocop-rspec 1.8.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rubocop-rspec"
  s.version = "1.8.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["John Backus", "Ian MacLeod", "Nils Gemeinhardt"]
  s.date = "2016-10-27"
  s.description = "    Code style checking for RSpec files.\n    A plugin for the RuboCop code style enforcing & linting tool.\n"
  s.email = ["johncbackus@gmail.com", "ian@nevir.net", "git@nilsgemeinhardt.de"]
  s.extra_rdoc_files = ["MIT-LICENSE.md", "README.md"]
  s.files = ["MIT-LICENSE.md", "README.md"]
  s.homepage = "http://github.com/backus/rubocop-rspec"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0")
  s.rubygems_version = "2.5.1"
  s.summary = "Code style checking for RSpec files"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rubocop>, [">= 0.42.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 3.4"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<anima>, [">= 0"])
      s.add_development_dependency(%q<concord>, [">= 0"])
      s.add_development_dependency(%q<adamantium>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<rubocop>, [">= 0.42.0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 3.4"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<anima>, [">= 0"])
      s.add_dependency(%q<concord>, [">= 0"])
      s.add_dependency(%q<adamantium>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<rubocop>, [">= 0.42.0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 3.4"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<anima>, [">= 0"])
    s.add_dependency(%q<concord>, [">= 0"])
    s.add_dependency(%q<adamantium>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
  end
end
