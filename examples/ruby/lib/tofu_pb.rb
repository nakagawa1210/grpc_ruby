# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: tofu.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("tofu.proto", :syntax => :proto3) do
    add_message "tofu.Daizu" do
      optional :name, :string, 1
      optional :count, :int32, 2
    end
    add_message "tofu.Tofu" do
      optional :name, :string, 1
      optional :size, :int32, 2
    end
    add_message "tofu.Person" do
      optional :name, :string, 1
    end
    add_message "tofu.Stock" do
      optional :amount, :int32, 1
    end
  end
end

module Tofu
  Daizu = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tofu.Daizu").msgclass
  Tofu = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tofu.Tofu").msgclass
  Person = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tofu.Person").msgclass
  Stock = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tofu.Stock").msgclass
end
