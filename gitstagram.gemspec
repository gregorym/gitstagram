require File.expand_path('../lib/gitstagram/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Gregory Marcilhacy"]
  gem.email         = ["g.marcilhacy@gmail.com"]
  gem.description   = gem.summary = "Take a snapshot after each commit."
  gem.homepage      = "https://github.com/gregorym/gitstagram"
  gem.required_ruby_version = '>= 1.9'

  gem.executables   = ['gitstagram']
  gem.files         = `git ls-files | grep -v myapp`.split("\n")
  gem.test_files    = `git ls-files -- spec/*`.split("\n")
  gem.name          = "gitstagram"
  gem.require_paths = ["lib"]
  gem.version       = Gitstagram::VERSION

  gem.add_development_dependency      'rspec'
end