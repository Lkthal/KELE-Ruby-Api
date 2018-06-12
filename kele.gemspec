
#lib = File.expand_path("../lib", __FILE__)
#$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
#require "kele/version"

Gem::Specification.new do |spec|
  spec.name          = "kele"
  spec.version       = '0.0.1'
  spec.date          = '2015-12-02'
  spec.summary       = 'Kele API Client'
  spec.description   = 'A client for the Bloc API'
  spec.authors       = ["Thal Syhabout"]
  spec.email         = ["tsyhabout@gmail.com"]
  spec.files         = ['lib/kele.rb','lib/roadmap.rb']
  spec.summary       = %q{TODO: Write a short summary, because RubyGems requires one.}
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = 'http://rubygems.org/gems/kele'
  spec.license       = "MIT"

  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'httparty', '~> 0.13'
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency 'json', '~> 1.8.3'
end
