
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rick_morty/version"

Gem::Specification.new do |spec|
  spec.name          = "rick_morty"
  spec.version       = RickMorty::VERSION
  spec.authors       = ["Rosa Carranza"]
  spec.email         = ["rcarranza1024@yahoo.com"]

  spec.summary       = %q{TODO: A list of Rick and Morty characters.}
  spec.description   = %q{TODO: Choose a character from the list to learn more about them.}
  spec.homepage      = "TODO: https://github.com/rcarranza24/rick_and_morty"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/rcarranza24/rick_and_morty"
    spec.metadata["changelog_uri"] = "https://github.com/rcarranza24/rick_and_morty"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
end
