# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hstore_utils/version"

Gem::Specification.new do |s|
  s.name        = "hstore_utils"
  s.version     = HstoreUtils::VERSION
  s.authors     = ["Luis Cruz", "Martina Simicic"]
  s.email       = ["luis.cruz@teclacolorida.com", "martina.simicic@escolinhas.pt"]
  s.homepage    = "https://github.com/kiddosware/hstore_utils"
  s.summary     = %q{Some utilities to make hstore easier.}
  s.description = %q{This gem is based on the railscast #345 HStore, that introduces the use of the HStore type for PostgreSQL. With this gem you can declare the key/values inside your Hstore attribute as attribute accessors :) Contributions are welcome! Note: It assumes you have the your PostgreSQL database configured to use the HStore type. Take a look at the activerecord-postgres-hstore gem.}

  s.rubyforge_project = "hstore_utils"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
