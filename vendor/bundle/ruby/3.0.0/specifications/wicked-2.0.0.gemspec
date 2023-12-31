# -*- encoding: utf-8 -*-
# stub: wicked 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "wicked".freeze
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Richard Schneeman".freeze]
  s.date = "2022-09-14"
  s.description = "Wicked is a Rails engine for producing easy wizard controllers".freeze
  s.email = ["richard.schneeman+rubygems@gmail.com".freeze]
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze]
  s.homepage = "https://github.com/schneems/wicked".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.5".freeze
  s.summary = "Use Wicked to turn your controller into a wizard".freeze

  s.installed_by_version = "3.3.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<railties>.freeze, [">= 3.0.7"])
    s.add_development_dependency(%q<rails>.freeze, [">= 3.0.7"])
    s.add_development_dependency(%q<capybara>.freeze, [">= 0"])
    s.add_development_dependency(%q<appraisal>.freeze, [">= 0"])
    s.add_development_dependency(%q<test-unit>.freeze, [">= 0"])
  else
    s.add_dependency(%q<railties>.freeze, [">= 3.0.7"])
    s.add_dependency(%q<rails>.freeze, [">= 3.0.7"])
    s.add_dependency(%q<capybara>.freeze, [">= 0"])
    s.add_dependency(%q<appraisal>.freeze, [">= 0"])
    s.add_dependency(%q<test-unit>.freeze, [">= 0"])
  end
end
