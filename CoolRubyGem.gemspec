# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'cool_ruby_gem'
  s.version     = '0.1.0'
  s.summary     = 'Implementation of Markov algorithms'
  s.description = 'A gem for transforming strings using Markov algorithms with loop protection.'
  s.authors     = ['Sofia']
  s.email       = ['apelsinsofa@gmail.com']
  s.homepage    = 'https://github.com/pfqyz/CoolRubyGem'
  s.license     = 'MIT'

  # Указываем, какие файлы входят в гем
  s.files       = Dir['lib/**/*.rb']
  s.require_paths = ['lib']

  # Минимальная версия Ruby (у вас 3.2)
  s.required_ruby_version = '>= 2.7.0'

  # Добавляем метаданные, чтобы убрать предупреждение.
  # URL должны быть настоящими, но для локальной сборки подойдут и такие.
  s.metadata = {
    "homepage_uri"    => "https://github.com/pfqyz/CoolRubyGem",
    "source_code_uri" => "https://github.com/pfqyz/CoolRubyGem"
  }

  # Зависимости для разработки (нужны для тестов)
  s.add_development_dependency 'minitest', '~> 5.0'
  s.add_development_dependency 'rake', '~> 13.0'
end