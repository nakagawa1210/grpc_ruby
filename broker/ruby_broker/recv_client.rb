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
  @msgid = count
 
  @data = stub.check_id(Msg::IdData.new(length: @length,
                                        command: @command,
                                        dest: @dest,
                                        msgid: @msgid))
  @recvdata.push @data

  loop do
    @time.push Process.clock_gettime(Process::CLOCK_MONOTONIC)
    @data = stub.recv_msg(Msg::IdData.new(length: @length,
                                          command: @command,
                                          dest: @dest,
                                          msgid: @msgid))
    @recvdata.push @data
    break if @data.dest == @msgid-1
  end
  
  @time.push Process.clock_gettime(Process::CLOCK_MONOTONIC)
  puts "num,send,svr_in,svr_out,recv"
    @recvdata.each do |s|
      puts "#{s.dest},#{s.length},#{s.command},#{s.msgid},#{@time.shift}"
    end
end

main

