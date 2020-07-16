#!/usr/bin/env ruby

# Copyright 2015 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Sample gRPC server that implements the Greeter::Helloworld service.
#
# Usage: $ path/to/greeter_server.rb

this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'tofu_services_pb'

$array = []

# GreeterServer is simple server that implements the Helloworld Greeter server.
class GreeterServer < Tofu::Greeter::Service
  # say_hello implements the SayHello rpc method.
  def create_tofu(daizu, _unused_call)
    $array.push daizu
    name = "#{daizu.name}_tofu"
    size = daizu.count * 2

    puts "#{$array}\n"
    Tofu::Tofu.new(name: name, size: size)
  end
  
  def buy_tofu(person, _unused_call)
    daizu = $array.shift
    name = daizu.name
    size = daizu.count * 2
    
    puts "#{$array}\n"
    Tofu::Tofu.new(name: name, size: size)
  end

  def check_tofu_stock(person, _unused_call)
    amount = $array.length
    Tofu::Stock.new(amount: amount)
  end
end

# main starts an RpcServer that receives requests to GreeterServer at the sample
# server port.
def main
  s = GRPC::RpcServer.new
  s.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
  s.handle(GreeterServer)
  # Runs the server with SIGHUP, SIGINT and SIGQUIT signal handlers to 
  #   gracefully shutdown.
  # User could also choose to run server via call to run_till_terminated
  s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
end

main
