Rails.application.routes.draw do
  root to: 'home#index'
  get '/', to: 'home#index'

  resources :developers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
