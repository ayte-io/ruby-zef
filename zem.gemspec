Gem::Specification.new do |s|
  s.name = 'zef'
  s.version = '0.1.0'
  s.licenses = ['MIT']
  s.summary = 'An opinionated Chef framework'
  s.authors = ['Ayte Labs']
  s.email = 'ops@ayte.io'
  s.files = Dir.glob(File.join(File.dirname(__FILE__), 'lib', '**.rb'))
  # noinspection RubyStringKeysInHashInspection
  s.metadata = {
    'source_code_uri' => 'https://github.com/ayte-labs/ruby-zef'
  }
end
