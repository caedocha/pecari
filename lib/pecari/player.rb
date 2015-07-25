module Pecari

  module Player

    def self.launch(video)
      command = "#{Pecari::Env.display} && xterm -e 'xterm -fullscreen -fg black -bg black -e omxplayer -o hdmi #{video}' &"
      fork do
        exec command
      end
    end

    def self.play_pause
      `#{Pecari::Env.display} && xdotool windowactivate #{omx_window} && xdotool key p`
    end

    def self.quit
      `#{Pecari::Env.display} && xdotool windowactivate #{omx_window} && xdotool key q`
    end

    def self.increase_volume
      `#{Pecari::Env.display} && xdotool windowactivate #{omx_window} && xdotool key plus`
    end

    def self.decrease_volume
      `#{Pecari::Env.display} && xdotool windowactivate #{omx_window} && xdotool key minus`
    end

    def self.seek_forward
      `#{Pecari::Env.display} && xdotool windowactivate #{omx_window} && xdotool key Right`
    end

    def self.seek_backward
      `#{Pecari::Env.display} && xdotool windowactivate #{omx_window} && xdotool key Left`
    end

    def self.exit
      Pecari::PidKiller.kill_all_omx_processes
    end

    private

    def self.omx_window
      Pecari::WindowInfo.omx_info
    end

    def self.xdotool_installed?
      package_installed?('xdotool')
    end

    def self.omxplayer_installed?
      package_installed?('omxplayer')
    end

    def self.package_installed?(package)
      !`dpkg -l | grep #{package} | awk '{print $3}'`.nil?
    end

  end

end
