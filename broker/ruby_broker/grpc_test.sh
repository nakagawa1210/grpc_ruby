#!/bin/bash
if [ -x  $HOME/.rbenv/bin/rbenv ]; then
    # rbenv
    PATH=$HOME/.rbenv/bin:$PATH
    eval "$(rbenv init -)"
    RUBY_DISPATCHER="rbenv"
fi

cd "$(dirname "$0")"

TIME=$(date "+%Y%m%d_%H%M")

echo start $3$1_$2_$TIME.log $(date "+%M:%S")
bundle exec ruby server.rb &
SRVID=$!
sleep 1
bundle exec ruby recv_client.rb $1 > log/$3$1_$2_$TIME.log &
RECVID=$!
bundle exec ruby send_client.rb $1 $2

while(true)
do
    if [ $(ps -p $RECVID | wc -l) = "1" ]; then
    break
    fi
    sleep 1
done

echo end $3$1_$2_$TIME.log $(date "+%M:%S")

kill -INT $SRVID

bundle exec ruby cal.rb log/$3$1_$2_$TIME.log

echo $3$1_$2_$TIME.log >> log/latest_file.log

