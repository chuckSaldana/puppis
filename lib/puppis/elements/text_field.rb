module Puppis
  module Elements
    class TextField < Puppis::Elements::Element
      default_class :ios, 'UITextField'

      custom_action '{{name}}', ->(me){ me.value }
      custom_action '{{name}}=', ->(me, new_value){ me.value = new_value }
    end
  end
end