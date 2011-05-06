#script for running anonymous hits to website for testing sid and pid information

#input the values
#
=begin
pids = {
  500 => [{:sid => 12, :requests => 5},
          {:sid => 15, :requests => 2},
          {:sid => 17, :requests => 20}],
  501 => [{:sid => 9, :requests => 5},
          {:sid => 30, :requests => 20}],
  505 => [{:sid => 39, :requests => 18}]
}
=end

def make_ps_req(website,pids)
  #access tor control to change circuit 
  exec_tor_control='./tor_new_circuit.sh'
  prequest=0
  pids.each do |pid, sr_list|
    sr_list.each do |req|
      req[:requests].times do
        Thread.new {`torify firefox "http://#{website}?pid=#{pid}&sid=#{req[:sid]}" &`}
        #Thread.new {`torify firefox "http://www.whatismyip.com" &`}
        sleep 75 
        prequest=prequest+1
        puts "You are on request number #{prequest}."
        puts `#{exec_tor_control}`
        puts `pkill firefox-bin`
      end  
    end
  end
end
