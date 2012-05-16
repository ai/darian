require './lib/darian/version'

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'darian'
  s.version = Darian::VERSION.dup
  s.date = Time.now.strftime('%Y-%m-%d')
  s.summary = 'Darian Mars Calendar Converter.'
  s.description = <<-EOF
    Converter from Earth dates to mars dates by Darian calendar.
  EOF

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {spec}/*`.split("\n")
  s.extra_rdoc_files = ['README.md', 'LICENSE']
  s.require_path     = 'lib'

  s.author   = 'Andrey "A.I." Sitnik'
  s.email    = 'andrey@sitnik.ru'
  s.homepage = 'https://github.com/ai/darian'

  s.add_development_dependency "bundler",   [">= 1.0.10"]
  s.add_development_dependency "yard",      [">= 0"]
  s.add_development_dependency "rake",      [">= 0"]
  s.add_development_dependency "rspec",     [">= 0"]
  s.add_development_dependency "redcarpet", [">= 0"]
end
