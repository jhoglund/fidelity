module Fidelity
  class WidgetHelper
    include ActionView::Helpers
    
    def select_first *arguments
      arguments.compact.first
    end

    def to_class_name *arguments
      arguments.compact.map(&:to_s).join(' ')
    end
    
    def class_name_if? test=nil, name='active'
      test ? name : ''
    end
  end
end