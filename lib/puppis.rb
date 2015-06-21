require_relative 'puppis/identifiers'
require_relative 'puppis/element_action'
require_relative 'puppis/elements'
require_relative 'puppis/config'

module Puppis
  def self.included(base)

    element_classes.each do |element_class|
      base.class.send(:define_method, Puppis.class_to_method_name(element_class)) do |*args|
        field_name = args[0]
        identifier_parts = args[1]
        Puppis.add_element_methods base, field_name, element_class, identifier_parts
      end
    end

  end

  def self.add_element_methods(base, field_name, element_class_name, identifier_parts)
    element_class = Puppis::Elements.const_get(element_class_name)

    parts = {class: element_class.default_class(Puppis::Config.platform)}
    parts = parts.merge(identifier_parts) if identifier_parts

    element_class.actions.each do |action_name, func|
      base.send(:define_method, Puppis.merge_field_and_action(field_name, action_name)) do |*inputs|
        func.call(*[element_class.new(parts), *inputs])
      end
    end
  end

  def self.element_classes
    Puppis::Elements.constants.select { |c| Puppis::Elements.const_get(c).is_a? Class }
  end

  def self.class_to_method_name(klass)
    klass.to_s.scan(/[A-Z][a-z]*/).join('_').downcase
  end

  def self.merge_field_and_action(field_name, action_name)
    action_name.gsub('{{name}}', field_name.to_s)
  end
end
