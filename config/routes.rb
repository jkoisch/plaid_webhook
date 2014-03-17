PlaidWebhook::Engine.routes.draw do
  resources :antennas
  root to: "antennas#index"
end
