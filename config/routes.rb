Rails.application.routes.draw do
  get 'transaction/timeout'
  get 'transaction/transaction'
  get 'transaction/confirmation'
  get 'transaction/validation'
  resources :payments
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
