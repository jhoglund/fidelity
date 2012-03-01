Rails.application.routes.draw do
  match "/fidelity" => 'fidelity/documentations#show'
  match "/fidelity/*id" => 'fidelity/documentations#show'
end
