lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'praxis/version'

Gem::Specification.new do |spec|
  spec.name          = "praxis"
  spec.version       = Praxis::VERSION
  spec.authors = ["Josep M. Blanquer","Dane Jensen"]
  spec.summary = 'Building APIs the way you want it.'

  spec.email = ["blanquer@gmail.com","dane.jensen@gmail.com"]

  spec.homepage = "https://github.com/rightscale/praxis"
  spec.license = "MIT"
  spec.required_ruby_version = ">=2.1"

  spec.require_paths = ["lib"]
  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir = 'bin'
  spec.executables << 'praxis'

  spec.add_dependency 'rack', '>= 1'
  spec.add_dependency 'mustermann', '>=0', '<=1'
  spec.add_dependency 'activesupport', '>= 3'
  spec.add_dependency 'mime', '~> 0'
  spec.add_dependency 'praxis-mapper', '~> 4.3'
  spec.add_dependency 'praxis-blueprints', '~> 3.3'
  spec.add_dependency 'attributor', '~> 5.1'
  spec.add_dependency 'thor', '~> 0.18'
  spec.add_dependency 'terminal-table', '~> 1.4'
  spec.add_dependency 'harness', '~> 2'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 0.9'
  spec.add_development_dependency 'rake-notes', '~> 0'
  if RUBY_PLATFORM !~ /java/
    spec.add_development_dependency 'pry', '~> 0'
    spec.add_development_dependency 'pry-byebug', '~> 1'
    spec.add_development_dependency 'pry-stack_explorer', '~> 0'
    spec.add_development_dependency 'sqlite3', '~> 1'
  else
    spec.add_development_dependency 'jdbc-sqlite3'
  end
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'rspec-its', '~> 1'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1'
  spec.add_development_dependency 'guard', '~> 2'
  spec.add_development_dependency 'guard-rspec', '~> 4'
  spec.add_development_dependency 'guard-bundler', '~> 2'
  spec.add_development_dependency 'rack-test', '~> 0'
  spec.add_development_dependency 'simplecov', '~> 0'
  spec.add_development_dependency 'fuubar', '~> 2'
  spec.add_development_dependency 'yard', '~> 0'
  spec.add_development_dependency 'coveralls'
end
