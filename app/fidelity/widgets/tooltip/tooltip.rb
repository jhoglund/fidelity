module Fidelity
  module Widget
    class Tooltip

      attr_accessor :template, :content
      def initialize template, options={}
        @template = template
      end
  
      def tip options={}, &block
        @content = Proc.new{ options[:text] }
        @content = template.capture(&block) if block_given?
        ''
      end
            
    end
  end
end