# -*- encoding: utf-8 -*-
require File.expand_path('../lib/grit_ext/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Saito"]
  gem.email         = ["saitowu@gmail.com"]
  gem.description   = %q{the grit's extension}
  gem.summary       = %q{gives grit utf-8 support and some misc enhancement}
  gem.homepage      = "http://saito.im"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "grit_ext"
  gem.require_paths = ["lib"]
  gem.version       = GritExt.version

  gem.add_dependency("charlock_holmes", "~> 0.6.9")
end
