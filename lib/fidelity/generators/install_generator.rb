require 'rails/generators'

module Fidelity
  module Generators
    class InstallGenerator < Rails::Generators::Base
      
      def add_assets
        insert_into_file "app/assets/javascripts/application.js", "//= require fidelity/app\n", :after => "jquery_ujs\n"
        insert_into_file "app/assets/stylesheets/application.css", " *= require fidelity/app\n", :after => "require_self\n"
      end
    end
  end
end