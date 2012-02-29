module Fidelity
  module Widget
    class Tab

      attr_accessor :template, :tabs, :vertical
      def initialize template, options={}
        @template = template
        @vertical = true if options[:orientation] and options[:orientation].to_sym == :vertical
        @tabs = []
      end
  
      def tab label='Tab', options={}, &block
        panel = Proc.new{ options[:text] }
        panel = template.capture(&block) if block_given?
        state = :active if options[:state]
        @tabs << TabPanel.new(label, panel, state)
      end
  
      def each
        @tabs.each do |tab|
          yield tab
        end
      end
      
      class TabPanel
        attr_accessor :label, :panel, :state
        def initialize label='Tab', panel='', state=nil
          @label = label
          @panel = panel
          @state = state
        end
      end
      
    end
  end
end