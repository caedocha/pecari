module Pecari

  module PidKiller 

    def self.kill_all_omx_processes
      kill_pids(omx_pids)
    end

   def self.omx_pids
      `ps aux | grep omxplayer | awk '{print $2}'`.split("\n")
   end

    def self.kill_pids(pids)
      pids.each do |pid|
        begin
          Process.kill('KILL', pid.to_i)
        rescue
          #Rails.logger.info("Could not kill process: #{pid}")
          #Rails.logger.info("Process info: #{`ps -p #{pid} -o comm=`}")
        end
      end
    end

  end

end
