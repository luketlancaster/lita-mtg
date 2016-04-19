Gem::Specification.new do |spec|
  spec.name          = "lita-mtg"
  spec.version       = "0.2.1"
  spec.authors       = ["Luke Lancaster"]
  spec.email         = ["luketlancaster@gmail.com"]
  spec.description   = "Lita plugin that returns a magic card!"
  spec.summary       = "Command: lita mtg '{cardname}'"
  spec.homepage      = "https://github.com/luketlancaster/lita-mtg"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.7"
  spec.add_runtime_dependency "mtg_sdk", ">= 2.0.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
