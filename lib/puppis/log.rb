module Puppis
  class Log
    class << self
      def instance
        unless @log
          @log = Logger.new(STDOUT).tap { |log| log.progname = 'puppis' }
          @log.level = Logger::INFO
        end
        @log
      end
    end
  end
end