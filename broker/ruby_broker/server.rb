this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(File.dirname(this_dir), 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'msg_broker_services_pb'

class Recv
  def initialize()
    
  end

  def each
    return enum_for(:each) unless block_given?
    loop do 
      recvdata = $array.shift
      time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

      puts "#{recvdata.dest},#{$array.length}"
      
      yield Msg::RecvData.new(length: recvdata.length,
                              command: recvdata.command,
                              dest: recvdata.dest,
                              msgid: 1,
                              message: recvdata.message,
                              T_1: recvdata.T_1,
                              T_2: recvdata.T_2,
                              T_3: time,
                              T_4: recvdata.T_4)
      
      break if $array.length == 0
    end
    $array_mu.unlock
  end
end



class MsgServer < Msg::Frame::Service
  def initialize()
    $array = []
    $array_mu = Mutex.new()
    @ID = []
  end
  
  def check_id(iddata, _unused_call)
    @ID.push iddata

    Msg::Response.new(length: 1,
                      command: 2,
                      dest: 3,
                      msgid: 4,
                      rescode: 5)
  end

  def recv_msg(iddata, _call)
    $array_mu.lock
    begin
      while $array.length == 0
        $array_mu.unlock
        sleep(0.001)
        $array_mu.lock
      end
      Recv.new().each
    ensure
      #$array_mu.unlock
    end
  end
  
  def send_msg(data)
    $array_mu.lock
    begin
      data.each_remote_read do |senddata|
        senddata.T_2 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        $array.push senddata
      end
    ensure
      $array_mu.unlock
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

