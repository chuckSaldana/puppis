module Puppis
  module ElementAction
    class NoDefaultSet; end

    BASE_ACTIONS =       {
        'touch_{{name}}'    => ->(me){me.element_touch},
        '{{name}}_element'  => ->(me){me},
        'wait_for_{{name}}' => ->(me){me.wait_for},
        '{{name}}_text'     => ->(me){me.text},
        '{{name}}?'         => ->(me){me.exists?}
    }

    def custom_action(method_name, func)
      actions.merge!({method_name => func})
    end

    def actions
      @actions ||= BASE_ACTIONS
    end

    def default_class(platform = nil, default = NoDefaultSet)
      @default_class ||= {}
      @default_class[platform] = default unless default == NoDefaultSet
      @default_class[platform]
    end
  end
end