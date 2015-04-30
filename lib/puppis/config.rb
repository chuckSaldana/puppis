module Puppis
  class Config
    class InvalidConfig < Exception; end
    ALLOWED_PLATFORMS = [:android, :ios]

    class << self
      def platform=(platform)
        raise InvalidConfig unless ALLOWED_PLATFORMS.include? platform
        @platform = platform
      end

      def platform
        @platform ||= :ios
      end
    end
  end
end