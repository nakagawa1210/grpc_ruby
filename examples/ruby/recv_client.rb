#!/usr/bin/env ruby
# coding: utf-8

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

# Sample app that connects to a Greeter service.
#
# Usage: $ path/to/greeter_client.rb

this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'tofu_services_pb'

def main(name)
  user = ARGV.size > 0 ?  ARGV[0] : 'world'
  hostname = ARGV.size > 1 ?  ARGV[1] : 'localhost:50051'
  stub = Tofu::Greeter::Stub.new(hostname, :this_channel_is_insecure)
  loop do
    begin
      loop do
        stock = stub.check_tofu_stock(Tofu::Person.new(name: name))
        break if stock.amount != 0
        p "sleep.."
        sleep 1
      end
      tofu = stub.buy_tofu(Tofu::Person.new(name: name))
      p "豆腐の名前は#{tofu.name}"
      p "豆腐の大きさは#{tofu.size}"
    rescue GRPC::BadStatus => e
      abort "ERROR: #{e.message}"
    end
  end
end

input_name = "aaaa"

main(input_name)

