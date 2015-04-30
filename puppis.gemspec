require_relative "lib/puppis/version"

Gem::Specification.new do |s|
  s.name        = "puppis"
  s.version     = Puppis::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ethan Hedrick"]
  s.email       = ["ethan@sneakysemicolon.com"]
  s.license     = 'MIT'
  s.homepage    = "http://github.com/ehedrick/puppis"
  s.summary     = %q{Puppis makes testing with Calabash even easier}
  s.description = %q{Puppis is an implementation of the page object pattern for use with calabash both on iOS and Android.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_development_dependency 'rspec'
end
