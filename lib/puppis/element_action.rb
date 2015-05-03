module Puppis
  module ElementAction

    BASE_ACTIONS =       {
        'touch_{{name}}'    => ->(me){me.touch},
        '{{name}}_element'  => ->(me){me},
        'wait_for_{{name}}' => ->(me){me.wait_for},
        '{{name}}_text'     => ->(me){me.text}
    }

    def custom_action(method_name, func)
      actions.merge!({method_name => func})
    end

    def actions
      @actions ||= BASE_ACTIONS
    end
  end
end