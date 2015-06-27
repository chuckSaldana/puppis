module Puppis
  module Elements
    class Element
      extend Puppis::ElementAction

      attr_reader :platform, :identifier
      default_class :ios, '*'

      def initialize(identifier_parts=nil)
        @platform = Puppis::Config.platform

        if @platform == :ios
          initialize_ios identifier_parts
        elsif @platform == :android
          initialize_android identifier_parts
        end
      end

      def text
        raise Puppis::Elements::ElementNotFoundError unless exists?
        query(@identifier).first.fetch('text')
      end
      alias_method :value, :text

      def element_touch
        raise Puppis::Elements::ElementNotFoundError unless exists?
        Puppis.log.debug "Attempting to touch `#{@identifier}`"
        wait_tap(@identifier)
        wait_for_none_animating
      end

      def element_wait_for(options = nil)
        if options
          wait_for(options) { not query(@identifier).empty? }
        else
          wait_for { not query(@identifier).empty? }
        end
        true
      end

      def exists?
        Puppis.log.debug "Looking for an element with the query: `#{@identifier}`"
        !query(@identifier).empty?
      end

      def value=(new_value)
        element_touch
        keyboard_enter_text new_value
        tap_keyboard_action_key
        wait_for_none_animating
      end

      private
      def initialize_ios(identifier_parts)
        self.class.send :include, Calabash::Cucumber::Core
        self.class.send :include, Calabash::Cucumber::KeyboardHelpers
        self.class.send :include, Calabash::Cucumber::KeychainHelpers
        self.class.send :include, Calabash::Cucumber::TestsHelpers
        self.class.send :include, Calabash::Cucumber::WaitHelpers
        @identifier = Puppis::Identifier::IOSIdentifier.generate identifier_parts
      end

      def initialize_android(identifier_parts)
        self.class.send :include, Calabash::Android::Operations
      end
    end
  end
end
