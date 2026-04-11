Gem::Specification.new do |s|
  s.name        = 'CoolRubyGem'
  s.version     = '0.1.0'
  s.summary     = "Реализация нормальных алгоритмов Маркова"
  s.authors     = ["pfqyz"]
  s.files       = Dir["lib/**/*.rb", "bin/*"]
  s.bindir      = 'bin'
  s.executables = ['markov-run']
  s.require_paths = ["lib"]
  s.add_development_dependency "minitest", "~> 5.0"
end