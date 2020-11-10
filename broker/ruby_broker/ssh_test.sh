#!/bin/bash
echo rsync
rsync $* --delete --archive ~/grpc_ruby nakagawa@hsc1.swlab.cs.okayama-u.ac.jp:~/

PWD=$(pwd)

ssh nakagawa@hsc1.swlab.cs.okayama-u.ac.jp source ~/.bash_profile && cd $PWD && ./grpc_test.sh 100000 1 ssh && ./grpc_test.sh 100000 2 ssh && ./grpc_test.sh 100000 4 ssh
