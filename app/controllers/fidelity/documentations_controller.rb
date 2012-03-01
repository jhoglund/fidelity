class Fidelity::DocumentationsController < ApplicationController
  prepend_view_path Fidelity::Engine.root.join("app/fidelity/doc")
  
  def show
    render :template => current_page
  end
  
  private
  
  def current_page
    'index'
  end
  
end