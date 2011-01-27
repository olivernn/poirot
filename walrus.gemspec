# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "walrus/version"

Gem::Specification.new do |s|
  s.name        = "walrus"
  s.version     = Walrus::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Oliver Nightingale", "Mark Evans"]
  s.email       = ["oliver.nightingale1@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/walrus"
  s.summary     = %q{mustaches}
  s.description = %q{mustaches are cool}

  s.rubyforge_project = "walrus"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
