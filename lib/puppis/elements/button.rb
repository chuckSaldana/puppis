module Puppis
  module Elements
    class Button < Puppis::Elements::Element
      default_class :ios, 'UIButton'

      def text
        query("#{@identifier} label").first.fetch('text')
      end
    end
  end
end