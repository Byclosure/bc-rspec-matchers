module Bc
  module RSpec
    module Matchers
      class DataStructure
        WILDCARD = :"***__w_i_l_d_c_a_r_d__***"

        def initialize(pattern)
          @pattern = pattern
        end
    
        def matches?(actual) # uses failure_message_for_should
          @actual = actual
      
          is_match(@actual, @pattern)
        end

        def description
          "match to #{@pattern.inspect}"
        end
    
        def failure_message_for_should
          "expected #{self} to match to #{@actual.inspect}. " + (@failure_message_for_should_fragments ||
             "Fragment #{@fragment_pattern.inspect} didn't match to #{@fragment_actual.inspect}."
          )
        end
    
        def failure_message_for_should_not
          "expected #{self} not to match to #{@actual.inspect}"
        end

        def to_s
          "#{self.class.basename}(#{@pattern.inspect})"
        end
    
        private

        def self.basename
          name.sub(/^.*::/, '')
        end

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
            if pattern.size == actual.size
              pattern.each_with_index do |el, i|
                return false unless is_match(actual[i], el)
              end
              true
            else
              @failure_message_for_should_fragments = "Fragment #{pattern.inspect}.size == #{pattern.size} where #{actual.inspect}.size == #{actual.size}"
              false
            end
          elsif pattern == WILDCARD
            !actual.blank?
          else
            actual == pattern
          end
        end
      end
      
      def match_data_structure(pattern)
        DataStructure.new(pattern)
      end
    end
  end
end
