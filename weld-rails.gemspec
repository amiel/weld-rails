# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "weld-rails/version"

Gem::Specification.new do |s|
  s.name        = "weld-rails"
  s.version     = Weld::VERSION
  s.authors     = ["Amiel Martin"]
  s.email       = ["amiel@carnesmedia.com"]
  s.homepage    = "http://github.com/amiel/weld-rails"
  s.summary     = %q{Weld-rails allows rails to use weld as a template handler.}
  s.description = <<-DESCRIPTION
    Weld-rails is currently alpha and should not be used in production.
    Currently, it can successfully compile a simple weld template using weld.js, jsdom (and it's dependencies), and Node (through ExecJS).
  DESCRIPTION

  s.rubyforge_project = "weld-rails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "execjs"
end
