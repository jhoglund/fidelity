module Fidelity
  class Builder
    COLUMN_SIZE = %w(zero one two three four five six seven eight nine ten eleven twelve)
    
    attr_reader :template, :widget_helpers
    def initialize template, &block
      @template = template
      @widget_helpers = Fidelity::WidgetHelpers.new
    end
    
    def column size=1
      template.content_tag('div', :class => [COLUMN_SIZE[size], 'columns'].join(' ')) do
        yield
      end
    end
    
    def row options={}
      template.content_tag('div', :class => widget_helpers.to_class_name('row', options[:border] ? 'border' : nil)) do
        yield
      end
    end

    def widget name='heading', options={}, &block
      relative_path = File.join('app', 'fidelity', 'widgets', name.to_s, 'views')
      app_path = Rails.root.join(relative_path)
      engine_path = Fidelity::Engine.root.join(relative_path)
      template_name = 'index'
      template_path = extract_file_path(app_path, template_name) || extract_file_path(engine_path, template_name)
      if template_path
        Fidelity::WidgetHelpers
        template.render(:template => template_path, :locals => { :fidelity_helper => widget_helpers, :options => options, :block => (block_given? ? template.capture(&block) : nil) })
      else
        raise ActionController::RoutingError, "No such widget: #{name}"
      end      
    end
    

    private
    
    def exists? path, name
      return false unless File.exists? path
      return !get_files(path, name).empty?
    end
    
    def extract_file_path path, name
      return Dir.glob(File.join(path, "#{name}.*")).first
    end
    
    def get_files path, name
      Dir.chdir(path){ Dir.glob("#{name}.*") }
    end
  end
end
