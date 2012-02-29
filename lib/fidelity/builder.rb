
module Fidelity
  class Builder
    COLUMN_SIZE = %w(zero one two three four five six seven eight nine ten eleven twelve)
    
    attr_reader :template, :widget_helpers
    def initialize template, &block
      @template = template
      @widget_helpers = Fidelity::WidgetHelper.new
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
      name = name.to_s
      relative_widget_path = File.join('app', 'fidelity', 'widgets', name)
      if view_templates = extract_file_path(File.join(relative_widget_path, 'views','index.*')) and not view_templates.blank?
        include_widget_helpers(File.join('app', 'fidelity', 'helpers','*.rb'), File.join(relative_widget_path,'helpers','*.rb'))
        builder = nil
        block = if block_given? 
          if klass = extract_file_path(File.join(relative_widget_path, "#{name}.rb")) and not klass.blank?
            require klass.first
            builder = "fidelity/widget/#{name}".classify.constantize.new(template, options)
            template.capture do
              block.call(builder)
            end
          else
            template.capture(&block)
          end
          
        else
          nil
        end
        locals = {name.to_sym => builder, :fidelity_helper => widget_helpers, :block => block, :options => options, :view_path => Fidelity::Engine.root.join(relative_widget_path, 'views')}
        template.render(:template => view_templates.first, :locals => locals)
        
      else
        raise ActionController::RoutingError, "No such widget: #{name}"
      end      
    end
    

    private
    
    def get_builder relative_widget_path, name
      {}.tap do |h|
        if klass = extract_file_path(File.join(relative_widget_path, "#{name}.rb")) and not klass.blank?
          require klass.first
          h[name.to_sym] = yield("fidelity/widget/#{name}".classify.constantize.new(template))
        end
      end
    end
        
    def extract_file_path path
      return [Rails.root, Fidelity::Engine.root].map do |root|
        Dir.glob(root.join(path))
      end.flatten
    end
    
    def include_widget_helpers *paths
      paths.each do |path|
        extract_file_path(path).each do |file_path|
          if file_name = file_path.match(/^.*\/(.*)\.rb/)
            template.singleton_class.module_eval(File.read(file_path) + "\ninclude #{"fidelity/#{file_name[1]}".classify}", file_path)
          end
        end
      end
    end
    
  end
end
