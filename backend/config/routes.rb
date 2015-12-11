Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  root to: 'application#lltv'

  namespace :api, defaults: { format: :json } do
    resources :users do
    end
  end
end