Gem::Specification.new do |s|
  s.name        = 'prospectus_dockerhub'
  s.version     = '0.0.5'
  s.date        = Time.now.strftime('%Y-%m-%d')

  s.summary     = 'Prospectus helpers for docker hub'
  s.description = 'Prospectus helpers for docker hub'
  s.authors     = ['Les Aker']
  s.email       = 'me@lesaker.org'
  s.homepage    = 'https://github.com/amylum/prospectus_dockerhub'
  s.license     = 'MIT'

  s.files       = `git ls-files`.split
  s.test_files  = `git ls-files spec/*`.split

  s.add_dependency 'prospectus', '~> 0.5.0'
  s.add_dependency 'nokogiri', '~> 1.8.0'

  s.add_development_dependency 'rubocop', '~> 0.50.0'
  s.add_development_dependency 'goodcop', '~> 0.1.0'
  s.add_development_dependency 'rake', '~> 12.1.0'
  s.add_development_dependency 'codecov', '~> 0.1.1'
  s.add_development_dependency 'rspec', '~> 3.7.0'
  s.add_development_dependency 'fuubar', '~> 2.2.0'
end
