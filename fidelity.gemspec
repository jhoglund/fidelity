# utf-8
$:.push File.expand_path("../lib", __FILE__)
require "fidelity/version"

Gem::Specification.new do |s|
  s.name        = 'fidelity'
  s.version     = Fidelity::VERSION.dup
  s.authors     = ['Jonas Höglunt']
  s.email       = ['jonas.hoglund@fjordnet.com']
  s.homepage    = 'https://github.com/jhoglund/fidelity'
  s.summary     = 'Simple prototyping DSL'
  s.description = 'Used for rapid UI prototyping.'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency("activesupport" , "~> 3.2")
  s.add_dependency("rails"         , "~> 3.2")
  s.add_dependency("zurb-foundation")
  s.add_dependency("rdiscount")
  s.add_dependency("coderay")
end