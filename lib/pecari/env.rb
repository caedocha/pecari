module Pecari

  module Env

    def self.display
      'export DISPLAY=:0'
    end

    def self.package_installed?(package)
      `dpkg -l | grep #{package} | awk '{print $3}'`.size > 0
    end

  end

end
