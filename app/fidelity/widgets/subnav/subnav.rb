module Fidelity
  module Widget
    class Subnav

      attr_accessor :template, :items, :title
      def initialize template, options={}
        @template = template
        @items = []
      end
  
      def item options={}, &block
        label = Proc.new{ options[:text] }
        label = template.capture(&block) if block_given?
        state = :active if options[:state]
        @items << Item.new(label, state)
      end
  
      def each
        @items.each do |item|
          yield item
        end
      end
      
      private
      
      class Item
        attr_accessor :label, :state
        def initialize label='Item', state=nil
          @label = label
          @state = state
        end
      end      
      
    end
  end
end