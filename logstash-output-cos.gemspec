Gem::Specification.new do |s|
  s.name            = 'logstash-output-cos'
  s.version         = '1.0.1'
  s.summary         = "Sends Logstash events to the Tencet Cloud Object Storage"
  s.description     = "This gem is a Logstash plugin required to be installed on top of the Logstash core pipeline using $LS_HOME/bin/logstash-plugin install gemname. This gem is not a stand-alone program"
  s.authors         = ["Dongxun Yin"]
  s.email           = 'dongxuny@gmail.com'
  s.require_paths = ["lib"]

  # Files
  s.files = Dir["lib/**/*","spec/**/*","*.gemspec","*.md","CONTRIBUTORS","Gemfile","NOTICE.TXT", "vendor/jar-dependencies/**/*.jar", "vendor/jar-dependencies/**/*.rb", "VERSION", "docs/**/*"]

  # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "output" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core-plugin-api", ">= 1.60", "<= 2.99"
  s.add_runtime_dependency 'logstash-mixin-aws'
  s.add_runtime_dependency "concurrent-ruby"
  s.add_runtime_dependency 'stud', '~> 0.0.22'
  s.add_development_dependency 'logstash-devutils'
  s.add_development_dependency 'logstash-input-generator'
  s.add_development_dependency 'logstash-codec-line'
end
