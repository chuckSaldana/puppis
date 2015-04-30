module Puppis
  module ElementAction
    def custom_action(method_name, func)
      actions.merge!({method_name => func})
    end

    def actions
      @actions ||= {}
      @actions
    end
  end
end