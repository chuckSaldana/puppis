module Puppis
  module Elements
    class Button < Puppis::Elements::Element
      custom_action 'foo', ->(me){puts me}
      default_class :ios, 'UIButton'
    end
  end
end