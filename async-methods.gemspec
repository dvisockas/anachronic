require_relative 'lib/async/methods/version'

Gem::Specification.new do |spec|
  spec.name          = "async-methods"
  spec.version       = Async::Methods::VERSION
  spec.authors       = ["Danielius Visockas"]
  spec.email         = ["danieliusvisockas@gmail.com"]

  spec.summary       = %q{Moving your method execution to the world of asynchronity}
  spec.description   = %q{Removing boilerplate from async code}
  spec.homepage      = 'https://github.com/dvisockas/async-methods'
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.1.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
