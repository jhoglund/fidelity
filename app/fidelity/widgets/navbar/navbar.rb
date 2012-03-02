module Fidelity
  module Widget
    class Navbar

      attr_accessor :template
      def initialize template, options={}
        @template = template
        @items = []
      end
  
      def item options={}, &block
        navbar_item(:default, options, &block)
      end
      
      def link options={}, &block
        navbar_item(:link, options, &block)
      end
      
      def flyout options={}, &block
        navbar_item(:flyout, options, &block)
      end
      
      
      def each
        @items.each do |item|
          yield item
        end
      end
      
      private
      
      def navbar_item type=:default, options={}, &block
        label = options[:text] || options[:label]
        content = block_given? ? template.capture(&block) : ''
        @items << Item.new(type, label, content, options[:path])
        ''
      end
            
      class Item
        attr_accessor :type, :label, :content, :path
        def initialize type=:default, label='Item', content='', path='#'
          @type = type
          @label = label || content
          @content = content
          @path = path
        end
        
        def item?
          @type == :default
        end

        def link?
          @type == :link
        end

        def flyout?
          @type == :flyout
        end
      end
      
    end
  end
end