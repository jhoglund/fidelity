module Fidelity

  class Engine < Rails::Engine
    config.to_prepare do
      ApplicationController.helper(FidelityHelper)
      [Fidelity::Engine, Rails].each do |app|
        ActionController::Base.view_paths << ActionView::FileSystemResolver.new(app.root.join("app/fidelity/**/views"))
      end
    end
  end

end