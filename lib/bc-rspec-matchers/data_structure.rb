module Bc
  module RSpec
    module Matchers
      class DataStructure
        WILDCARD = :"***__w_i_l_d_c_a_r_d__***"

        def initialize(pattern)
          @pattern = pattern
        end
    
        def matches?(actual)
          @actual = actual
      
          is_match(@actual, @pattern)
        end
    
        def failure_message_for_should
          "expected #{@pattern.inspect} to match to #{@actual.inspect}. Fragment #{@fragment_pattern.inspect} didn't match to #{@fragment_actual.inspect}."
        end
    
        def failure_message_for_should_not
          "expected #{@pattern.inspect} not to match to #{@actual.inspect}"
        end

        def to_s
          "#{self.class.name}(#{@pattern.inspect})"
        end
    
        private

        def is_match(actual, pattern)
          @fragment_actual, @fragment_pattern = actual, pattern
          if !actual.is_a?(pattern.class)
            return false
          end
      
          if pattern.is_a?(Hash)
            pattern.each do |(k,v)|
              if !actual.has_key?(k)
                @fragment_actual, @fragment_pattern = actual, {k => v}
                return false
              end
              return false unless is_match(actual[k], v)
            end
            true
          elsif pattern.is_a?(Array)
            pattern.each_with_index do |el, i|
              return false unless is_match(actual[i], el)
            end
            true
          elsif pattern == WILDCARD
            !actual.blank?
          else
            actual == pattern
          end
        end
      end
    end
  end
end
