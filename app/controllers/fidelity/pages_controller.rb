class Fidelity::PagesController < ApplicationController

  layout Fidelity::layout

  rescue_from ActionView::MissingTemplate do |exception|
    if exception.message =~ %r{Missing template fidelity}
      raise ActionController::RoutingError, "No such page: #{current_page}"
    else
      raise exception
    end
  end

  def show
    render :template => current_page, :layout => Fidelity::layout
  end

  protected

    def current_page
      "/fidelity#{clean_path}/index"
    end

    def clean_path
      params[:id] ? "/#{params[:id]}" : ""
    end

end
