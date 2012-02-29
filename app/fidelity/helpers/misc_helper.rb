module Fidelity
  module MiscHelper
    
    def to_html_attributes *args      
      [''].tap do |a|
        to_attribute_hash(args).each do |name, value|
          a << %Q(#{name.to_s}="#{value}")
        end
      end.join(' ').html_safe
    end
    
    private
    
    def to_attribute_hash args
      args.extract_options!.tap do |arguments|
        if options = args.shift and not args.empty?
          args.each do |name|
            arguments.merge!(name => options[name])
          end
        end 
      end
    end
    
  end
end