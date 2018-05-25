module BinInstall
  module Shell
    def self.yes?(value)
      ['y', 'yes'].include?(value.downcase)
    end

    def self.default_yes?(value)
      ['', 'y', 'yes'].include?(value.downcase)
    end

    def self.no?(value)
      ['n', 'no'].include?(value.downcase)
    end

    def self.default_no?(value)
      ['', 'n', 'no'].include?(value.downcase)
    end

    def self.executable_exists?(executable)
      system("which #{executable}")
    end

    def self.profile
      # TODO: Support .bash_profile as well.
      File.expand_path('~/.zshrc')
    end
  end
end
