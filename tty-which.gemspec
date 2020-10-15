require_relative "lib/tty/which/version"

Gem::Specification.new do |spec|
  spec.name          = "tty-which"
  spec.version       = TTY::Which::VERSION
  spec.authors       = ["Piotr Murach"]
  spec.email         = ["piotr@piotrmurach.com"]
  spec.summary       = %q{Platform independent implementation of Unix which command.}
  spec.description   = %q{Platform independent implementation of Unix which command.}
  spec.homepage      = "https://ttytoolkit.org"
  spec.license       = "MIT"
  spec.metadata = {
    "allowed_push_host" => "https://rubygems.org",
    "bug_tracker_uri"   => "https://github.com/piotrmurach/tty-which/issues",
    "changelog_uri"     => "https://github.com/piotrmurach/tty-which/blob/master/CHANGELOG.md",
    "documentation_uri" => "https://www.rubydoc.info/gems/tty-which",
    "homepage_uri"      => spec.homepage,
    "source_code_uri"   => "https://github.com/piotrmurach/tty-which"
  }
  spec.files         = Dir["lib/**/*", "README.md", "CHANGELOG.md", "LICENSE.txt"]
  spec.extra_rdoc_files = ["README.md"]
  spec.bindir        = "exe"
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.0.0"

  spec.add_development_dependency "rspec", ">= 3.0"
  spec.add_development_dependency "rake"
end
