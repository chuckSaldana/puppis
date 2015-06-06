module Puppis
  module Elements
    class Element
      extend Puppis::ElementAction

      attr_reader :platform

      def initialize
        @platform = Puppis::Config.platform

        if @platform == :ios
          self.class.send :include, Calabash::Cucumber::Core
          self.class.send :include, Calabash::Cucumber::KeyboardHelpers
          self.class.send :include, Calabash::Cucumber::KeychainHelpers
          self.class.send :include, Calabash::Cucumber::TestsHelpers
          self.class.send :include, Calabash::Cucumber::WaitHelpers
        elsif @platform == :android
          self.class.send :include, Calabash::Android::Operations
        end
      end
    end
  end
end
