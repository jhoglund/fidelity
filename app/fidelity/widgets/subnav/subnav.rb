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
        @items << Item.new(label, state, options[:path])
      end
  
      def each
        @items.each do |item|
          yield item
        end
      end
      
      private
      
      class Item
        attr_accessor :label, :state, :path
        def initialize label='Item', state=nil, path='#'
          @label = label
          @state = state
          @path = path
        end
      end      
      
    end
  end
end