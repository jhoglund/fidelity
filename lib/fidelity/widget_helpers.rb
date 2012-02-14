module Fidelity
  class WidgetHelpers
    include ActionView::Helpers
    
    def select_first *arguments
      arguments.compact.first
    end

    def to_class_name *arguments
      arguments.compact.map(&:to_s).join(' ')
    end
  end
end