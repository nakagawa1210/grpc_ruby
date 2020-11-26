this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(File.dirname(this_dir), 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'msg_broker_services_pb'

class MsgServer < Msg::Frame::Service
  def initialize()
    $array = []
    @ID = []
  end

  def makedata
    recvdata = $array.shift
    
    Msg::RecvData.new(length: recvdata.length,
                      command: recvdata.command,
                      dest: recvdata.dest,
                      msgid: 1,
                      message: recvdata.message,
                      T_1: recvdata.T_1,
                      T_2: recvdata.T_2,
                      T_3: Process.clock_gettime(Process::CLOCK_MONOTONIC),
                      T_4: recvdata.T_4)
  end
  
  def check_id(iddata, _unused_call)
    @ID.push iddata

    Msg::Response.new(length: 1,
                      command: 2,
                      dest: 3,
                      msgid: 4,
                      rescode: 5)
  end

  def recv_msg(iddata,_unused_call)
    loop do
      break if $array.length != 0
    end
    
    makedata
  end
  
  def send_msg(data)
    data.each_remote_read do |senddata|
      senddata.T_2 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      
      $array.push senddata
    end
    
    Msg::Response.new(length: 1,
                      command: 2,
                      dest: 3,
                      msgid: 4,
                      rescode: 5)
  end
end

def main ()
  s = GRPC::RpcServer.new
  s.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
  s.handle(MsgServer.new())

  s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
end

main

