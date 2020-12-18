#!/bin/bash
echo rsync
rsync $* --delete --archive ~/grpc_ruby/ nakagawa@hsc1.swlab.cs.okayama-u.ac.jp:grpc_ruby/

ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 1 ssh_mu_win100000_ 100000
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 2 ssh_mu_win100000_ 100000
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 4 ssh_mu_win100000_ 100000

ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 1 ssh_mu_win50000_ 50000
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 2 ssh_mu_win50000_ 50000
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 4 ssh_mu_win50000_ 50000

ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 1 ssh_mu_win20000_ 20000
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 2 ssh_mu_win20000_ 20000
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 4 ssh_mu_win20000_ 20000

ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 1 ssh_mu_win10000_ 10000
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 2 ssh_mu_win10000_ 10000
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 4 ssh_mu_win10000_ 10000

ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 1 ssh_mu_win5000_ 5000
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 2 ssh_mu_win5000_ 5000
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 4 ssh_mu_win5000_ 5000

ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 1 ssh_mu_win2000_ 2000
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 2 ssh_mu_win2000_ 2000
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 4 ssh_mu_win2000_ 2000

ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 1 ssh_mu_win1000_ 1000
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 2 ssh_mu_win1000_ 1000
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 4 ssh_mu_win1000_ 1000

ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 1 ssh_mu_win500_ 500
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 2 ssh_mu_win500_ 500
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 4 ssh_mu_win500_ 500

ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 1 ssh_mu_win200_ 200
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 2 ssh_mu_win200_ 200
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 4 ssh_mu_win200_ 200

ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 1 ssh_mu_win100_ 100
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 2 ssh_mu_win100_ 100
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 4 ssh_mu_win100_ 100

ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 1 ssh_mu_win50_ 50
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 2 ssh_mu_win50_ 50
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 4 ssh_mu_win50_ 50

ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 1 ssh_mu_win20_ 20
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 2 ssh_mu_win20_ 20
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 4 ssh_mu_win20_ 20

ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 1 ssh_mu_win10_ 10
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 2 ssh_mu_win10_ 10
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 4 ssh_mu_win10_ 10

ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 1 ssh_mu_win5_ 5
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 2 ssh_mu_win5_ 5
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 4 ssh_mu_win5_ 5

ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 1 ssh_mu_win2_ 2
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 2 ssh_mu_win2_ 2
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 4 ssh_mu_win2_ 2

ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 1 ssh_mu_win1_ 1
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 2 ssh_mu_win1_ 1
ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp grpc_ruby/broker/ruby_broker/grpc_test.sh 100000 4 ssh_mu_win1_ 1

echo rsync
rsync $* --delete --archive nakagawa@hsc1.swlab.cs.okayama-u.ac.jp:grpc_ruby/broker/ruby_broker/log/ log/
