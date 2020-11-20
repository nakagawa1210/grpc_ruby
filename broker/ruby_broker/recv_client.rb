this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(File.dirname(this_dir), 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'msg_broker_services_pb'

def main
  count = ARGV.size > 0 ?  ARGV[0].to_i : 10
  hostname = ARGV.size > 1 ?  ARGV[1] : 'localhost:50051'
  stub = Msg::Frame::Stub.new(hostname, :this_channel_is_insecure)

  @recvdata = []
  @time = []
  
  @length = 1
  @command = 2
  @dest = 3
  @msgid = 4


  @iddata = Msg::IdData.new(length: @length,
                            command: @command,
                            dest: @dest,
                            msgid: @msgid)
  
  response = stub.check_id(@iddata)

  loop do
    @data = stub.recv_msg(@iddata)
    @data.T_4 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    @recvdata.push @data
    break if @data.dest == count-1
  end
  
  puts "num,send,svr_in,svr_out,recv"
    @recvdata.each do |s|
      puts "#{s.dest},#{s.T_1},#{s.T_2},#{s.T_3},#{s.T_4}"
    end
end

main

