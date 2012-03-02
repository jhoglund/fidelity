module Fidelity
  module FormHelper
        
    def with_label options={}, &block
      uid = "uid_#{options.object_id}"
      label = if options[:label]
        label_options = { :for => uid }
        label_options.merge!({:class => 'inline'}) if options[:inline_label]
        content_tag(:label, options[:label], label_options)
      else
        ''
      end
      if block_given?
        ''.html_safe.tap do |output|
          capture do
            output << label
            output << yield(uid)
          end        
        end
      else
        label
      end
    end
    
    def form_field_with_error options={}, &block
      if block_given?
        if options[:error]
          content = ''.html_safe.tap do |output|
            capture do
              output << yield
              output << content_tag(:small, options[:error])
            end        
          end
          content_tag(:div, content, :class => 'form-field error')
        else
          content_tag(:span) do
            yield
          end
        end
      end
    end
     
  end
end