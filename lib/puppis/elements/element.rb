module Puppis
  module Elements
    class Element
      include Puppis::ElementAction

      attr_reader :platform

      def initialize
        @platform = Puppis::Config.platform

        if @platform == :ios
          class_eval do
            include Calabash::Cucumber::Core
            include Calabash::Cucumber::KeyboardHelpers
            include Calabash::Cucumber::KeychainHelpers
            include Calabash::Cucumber::TestsHelpers
            include Calabash::Cucumber::WaitHelpers
          end
        else
          raise "TODO"
        end
      end
    end
  end
end
