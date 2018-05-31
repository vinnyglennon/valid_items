# frozen_string_literal: true
version = File.read('VERSION').strip

Gem::Specification.new do |s|
  s.name        = 'valid_items'
  s.version     = version
  s.date        = '2018-05-31'
  s.summary     = 'Check that all your Rails ActiveRecord Objects still pass their model validations'
  s.description = 'Goes through all your Rails ActiveRecord objects and check if they are all still pass your model validations. You may have added new validations to your model since creating your object, or ran update_column in your console to solve a production issue. Find issues in your db before others do. Inspired by a RailsConf talk by Ryan Laughlin and his talk at http://www.rofreg.com/talks/railsconf2018'
  s.authors     = ['Vinny Glennon']
  s.email       = 'vinnyglennon@gmail.com'
  s.platform    = Gem::Platform::RUBY
  s.files       = `git ls-files`.split($/)
  s.test_files = s.files.grep(%r{^(test)/})
  s.homepage = 'http://rubygems.org/gems/valid_items'
  s.require_paths = ["lib"]
  s.license = 'MIT'
  s.required_ruby_version = '>= 1.9'
  s.test_files = s.files.grep(%r{^(test|spec|features)/})
  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'rubocop', '~> 0.50.0'
  s.add_dependency 'rails', '>= 5', '< 6.0'
end
