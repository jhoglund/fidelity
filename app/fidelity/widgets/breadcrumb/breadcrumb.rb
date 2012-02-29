module Fidelity
  module Widget
    class Breadcrumb

      attr_accessor :template, :items
      def initialize template, options={}
        @template = template
        @items = []
      end
  
      def item label='Item', options={}, &block
        content = template.capture(&block) if block_given?
        state = options[:state] || :default
        @items << Item.new(label, content, state, options[:path])
      end
  
      def each
        @items.each do |item|
          yield item
        end
      end
      
      class Item
        attr_accessor :label, :content, :state, :path
        def initialize label='Item', content=nil, state=:default, path='#'
          @label = label
          @content = content
          @state = state
          @path = path
        end
        
        def current?
          @state == :current
        end
        
        def unavailable?
          @state == :unavailable
        end
        
      end
      
    end
  end
end