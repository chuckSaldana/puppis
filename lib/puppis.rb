require_relative 'puppis/identifiers'
require_relative 'puppis/element_action'
require_relative 'puppis/elements'
require_relative 'puppis/config'

module Puppis
  def self.included(base)
    classes = Puppis::Elements.constants.select { |c| Puppis::Elements.const_get(c).is_a? Class }

    classes.each do |klass|
      base.class.send(:define_method, Puppis.class_to_method_name(klass)) do |*args|
        field_name = args[0]
        cls = Puppis::Elements.const_get(klass).new

        cls.actions.each do |action_name, func|
          base.send(:define_method, Puppis.merge_field_and_action(field_name, action_name)) do |*args|
            func.call(*[cls, *args])
          end
        end
      end
    end

  end

  def self.class_to_method_name(klass)
    klass.to_s.scan(/[A-Z][a-z]*/).join('_').downcase
  end

  def self.merge_field_and_action(field_name, action_name)
    action_name.gsub('{{name}}', field_name.to_s)
  end
end