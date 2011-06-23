# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "string_comparision/version"

Gem::Specification.new do |s|
  s.name        = "string_comparision"
  s.version     = StringComparision::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Chandra Mohan Thakur"]
  s.email       = ["chandra.thakur@sprout-technology.com"]
  s.homepage    = "http://www.cmthakur.co.cc"
  s.summary     = %q{string comparision gem provides you the facility of comparision between two string and returns how much % the string is matched.
                      Similiarly it provides the quality test for a obtained hash and expected hash.}
  s.description = %q{Quality control is the main theme of this gem. It cam be implied where there is two hash one is what you expect and one is what                  you got}

  s.rubyforge_project = "string_comparision"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
