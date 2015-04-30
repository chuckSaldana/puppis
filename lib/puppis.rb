require_relative 'puppis/elements'
require_relative 'puppis/element_action'
require_relative 'puppis/config'

module Puppis
  def self.included(base)
    classes = Puppis::Elements.constants.select { |c| Puppis::Elements.const_get(c).is_a? Class }

    classes.each do |klass|
      klass.actions.each do |action_name, func|
        base.send(:define_method, action_name) do |*args|
          func.call(*[klass.new, *args])
        end
      end
    end

  end
end