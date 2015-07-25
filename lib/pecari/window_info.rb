module Pecari

  module WindowInfo

    def self.omx_info
      all_windows.select do |window|
        window_info(window).include? 'WM_NAME(STRING) = "omxplayer"'
      end.first
    end

    def self.all_windows
      results = `#{Pecari::Env.display} && xprop -root | grep _NET_CLIENT_LIST_STACKING\\(WINDOW\\)`
      results.gsub('_NET_CLIENT_LIST_STACKING(WINDOW): window id #', '')
        .split(', ')
        .map{ |r| r.strip }
    end

    def self.window_info(window)
      `#{Pecari::Env.display} && xprop -id #{window}`
    end

  end

end
