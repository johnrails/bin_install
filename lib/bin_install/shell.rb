module BinInstall
  module Shell
    def self.yes?(value)
      %w[y yes].include?(value.downcase)
    end

    def self.default_yes?(value)
      ['', 'y', 'yes'].include?(value.downcase)
    end

    def self.no?(value)
      %w[n no].include?(value.downcase)
    end

    def self.default_no?(value)
      ['', 'n', 'no'].include?(value.downcase)
    end

    def self.executable_exists?(executable)
      system("which #{executable}")
    end

    def self.append_to_profiles(value)
      profile_paths.each do |path|
        file = File.open(path, 'a+')

        if file.read.include?(value)
          puts "Value already exist in #{path}. Skipping file injection.".blue
        else
          puts "Writing to #{path}:\n#{value.to_s.purple}"
          file << value.to_s
        end

        file.close
      end
    end

    def self.profile_paths
      [File.expand_path('~/.zshrc'), File.expand_path('~/.bash_profile')]
    end

    def self.wait(seconds = 10)
      print 'Please wait: '.purple
      seconds.downto(1) do |i|
        print i.to_s.purple
        3.times do
          sleep(0.25)
          print '.'.purple
        end
        sleep(0.25)
      end
      print "\n"
    end
  end
end
