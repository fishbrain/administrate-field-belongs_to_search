$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |gem|
  gem.name = 'administrate-field-belongs_to_search'
  gem.version = '0.0.1'
  gem.authors = ['Klas Eskilson']
  gem.email = ['klas.eskilson@gmail.com']
  gem.homepage = 'https://github.com/fishbrain/administrate-field-belongs_to_search'
  gem.summary = 'Plugin that adds search capabilities to belongs_to associations for Administrate'
  gem.license = 'MIT'

  gem.require_paths = ['lib']
  gem.files = `git ls-files`.split('\n')
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split('\n')

  gem.add_dependency 'administrate', '>= 0.3.0'
  gem.add_dependency 'rails', '>= 4.2'
  gem.add_dependency 'selectize-rails', '~> 0.6'

  gem.add_development_dependency 'coveralls'
  gem.add_development_dependency 'factory_girl', '~> 4.8'
  gem.add_development_dependency 'rspec', '~> 3.4'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'sqlite3'

  gem.description = <<-DESCRIPTION
Add support to search through (potentially large) belongs_to associations in your Administrate dashboards.
  DESCRIPTION
end
