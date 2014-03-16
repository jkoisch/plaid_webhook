Rails.application.routes.draw do

  mount PlaidWebhook::Engine => "/plaid_webhook"
end
