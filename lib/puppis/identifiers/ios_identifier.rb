module Puppis
  module Identifier
    class IOSIdentifier
      VALID_PARTS = [:class, :marked, :label, :text, :index, :query]

      class << self
        def generate(parts)
          validate_parts parts
          if parts.has_key? :query
            # query always always always overrides anything else
            parts[:query]
          else
            query_pieces = [parts[:class]]
            parts.delete :class

            parts.each do |name, value|
              query_pieces << case name
                when :label
                  "marked:'#{value}'"
                when :index
                  "index:#{value}"
                else
                  "#{name}:'#{value}'"
              end
            end

            query_pieces.join(' ')
          end
        end

        def validate_parts(parts)
          unless (parts.keys - VALID_PARTS).empty?
            raise Puppis::Identifier::InvalidPartsError.new("Only allowed parts are: #{VALID_PARTS}")
          end

          unless parts.has_key?(:class) || parts.has_key?(:query)
            raise Puppis::Identifier::ClassPartMissingError
          end

          true
        end
      end
    end
  end
end