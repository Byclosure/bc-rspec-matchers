module Bc
  module RSpec
    module Matchers
      class ContentType
        @@sym_to_regexp = {
          :json => /application\/json\s*;\s*charset=utf-8/
        }
        
        attr_reader :symbol, :header
        def initialize(content_type_symbol)
          @symbol = content_type_symbol.to_sym
        end

        def matches?(actual)
          @header = actual
          content_type(actual) =~ sym_to_regexp(symbol)
        end

        def failure_message_for_should
          "Content-Type was #{content_type(header).inspect}, expecting type #{symbol} (#{sym_to_regexp(symbol).inspect})"
        end

        def failure_message_for_should_not
          "Content-Type (#{content_type(header).inspect}) should not match #{symbol} (#{sym_to_regexp(symbol).inspect})"
        end

        def description
          "have Content-Type of type #{symbol}"
        end
        
        private
        def content_type(header)
          raise(ArgumentError.new("Expecting #{header.inspect} to be an header (type Hash)")) unless header.is_a?(Hash)
          header["Content-Type"]
        end

        def sym_to_regexp(symbol)
          @@sym_to_regexp[symbol] || raise(ArgumentError.new("Symbol (#{symbol}) Found"))
        end
      end
    end
  end
end