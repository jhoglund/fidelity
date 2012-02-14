module FidelityHelper
  def fidelity_for options={}, &block
    width = options[:width] || 800
    content_tag('div', :class => 'container', :style => "width:#{width}px") do
      yield Fidelity::Builder.new(self, &block) if block_given?
    end
  end  
end
