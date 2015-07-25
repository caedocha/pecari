module Pecari

  module Player

    def self.launch(video)
      check_dependencies
      command = "#{Pecari::Env.display} && xterm -e 'xterm -fullscreen -fg black -bg black -e omxplayer -o hdmi #{video}' &"
      fork do
        exec command
      end
    end

    def self.play_pause
      check_dependencies
      `#{Pecari::Env.display} && xdotool windowactivate #{omx_window} && xdotool key p`
    end

    def self.quit
      check_dependencies
      `#{Pecari::Env.display} && xdotool windowactivate #{omx_window} && xdotool key q`
    end

    def self.volume_up
      check_dependencies
      `#{Pecari::Env.display} && xdotool windowactivate #{omx_window} && xdotool key plus`
    end

    def self.volume_down
      check_dependencies
      `#{Pecari::Env.display} && xdotool windowactivate #{omx_window} && xdotool key minus`
    end

    def self.seek_forward
      check_dependencies
      `#{Pecari::Env.display} && xdotool windowactivate #{omx_window} && xdotool key Right`
    end

    def self.seek_backward
      check_dependencies
      `#{Pecari::Env.display} && xdotool windowactivate #{omx_window} && xdotool key Left`
    end

    def self.exit
      Pecari::PidKiller.kill_all_omx_processes
    end

    private

    def self.omx_window
      Pecari::WindowInfo.omx_info
    end

    def self.check_dependencies
      raise UnavailableXDoToolError unless xdotool_installed?
      raise UnavailableOMXPlayerError unless omxplayer_installed?
    end

    def self.xdotool_installed?
      Pecari::Env.package_installed?('xdotool')
    end

    def self.omxplayer_installed?
      Pecari::Env.package_installed?('omxplayer')
    end

  end

end

class UnavailableXDoToolError < StandardError

  def message
    <<-EOF
      Cannot find xdotool on you system. Try installing it with this commend:
      "sudo apt-get install xdotool"
    EOF
  end

end

class UnavailableOMXPlayerError < StandardError

  def message
    <<-EOF
      Cannot find omxplayer on you system. Try installing it with this commend:
      "sudo apt-get install omxplayer"
    EOF
  end

end
