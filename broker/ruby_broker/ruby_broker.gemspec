# -*- ruby -*-
# encoding: utf-8

Gem::Specification.new do |s|
  s.name          = 'ruby_broker'
  s.version       = '0.0.1'
  s.authors       = ['Yusuke Nakagawa']
#  s.email         = 'temiola@google.com'
  s.homepage      = 'https://github.com/nakagawa1210/grpc_ruby'
  s.summary       = 'gRPC Ruby broker'
  s.description   = 'gRPC Ruby broker'

  s.files         = `git ls-files -- ruby/*`.split("\n")
  s.executables   = `git ls-files -- ruby/greeter*.rb ruby/route_guide/*.rb`.split("\n").map do |f|
    File.basename(f)
  end
  s.require_paths = ['lib']
  s.platform      = Gem::Platform::RUBY

  s.add_dependency 'grpc', '~> 1.0'
  s.add_dependency 'multi_json', '~> 1.13.1'
  s.add_development_dependency 'bundler', '>= 1.9'
  s.add_development_dependency 'grpc-tools', '>= 1.32'
end
