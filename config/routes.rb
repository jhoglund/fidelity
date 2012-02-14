Rails.application.routes.draw do
  root :to => 'fidelity/pages#show'
  match "/*id" => 'fidelity/pages#show', :as => :page, :format => false
end
