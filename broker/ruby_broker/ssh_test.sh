#!/bin/bash
echo rsync
rsync $* --delete --archive ~/grpc_ruby/ nakagawa@hsc1.swlab.cs.okayama-u.ac.jp:grpc_ruby/

ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 1 ssh
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 2 ssh
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 4 ssh

rsync $* --delete --archive nakagawa@hsc1.swlab.cs.okayama-u.ac.jp:grpc_ruby/broker/ruby_broker/log/ log/
