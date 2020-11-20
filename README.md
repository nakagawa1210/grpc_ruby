gRPC_ruby 
===================================

gRPC を用いてRuby で作成したメッセージブローカ

grpc_ruby/broker 以下のディレクトリに作成したプログラムをおいている．

# 各ディレクトリとファイルの説明
protos ディレクトリ:purotocol buffer で書かれたファイルが存在するディレクトリ

msg_broker.proto:gRPC で使用するサービス定義を行っている．

ruby_broker ディレクトリ:作成したプログラムとプログラムを実行するシェルスクリプトが存在するディレクトリ

cal.rb:プログラムが作成した.log ファイルから差を計算しlogディレクトリ以下に.csv ファイルとして出力する．

compile.sh:.proto ファイルをコンパイルするシェルスクリプト

grpc_test.sh:引数にメッセージ送信回数とデータのサイズ(ｋB)をとり，プログラムを実行するシェルスクリプト

make_graph.sh:.csv ファイルをgnuplotを用いて.png の図を作成するシェルスクリプト

recv_client.rb:メッセージを受信し，測定した時刻を.log ファイルとしてlogディレクトリ以下に出力する．

send_client.rb:メッセージをサーバに送信する．

server.rb:メッセージを送受信するサーバ

ssh_test.sh:sshでhsc1に接続し，メッセージの送受信100000回を1kB，2kB，4kBの三回実行するシェルスクリプト

実行手順
以下のコマンドでクローンする．

git clone https://github.com/nakagawa1210/grpc_ruby.git

ruby_broker ディレクトリに移動する．

cd grpc_ruby/broker/ruby_broker

compile.sh を実行する．

./compile.sh

grpc_test.sh を実行する．以下のコマンドの場合メッセージ数100，データサイズ1kBで実行する．

./grpc_test.sh 100 1

make_graph.sh を実行する．log/graph ディレクトリにpng 形式で作成された図が保存される．

./make_graph.sh