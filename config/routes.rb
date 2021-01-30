Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'claims#index'

  resources :claims, except: %i[show edit update destroy]
  resources :inspection_calls  do
    get 'adjuster', on: :collection
    get 'claimant', to: "inspection_calls#adjuster", on: :collection
  end
  resources :tokens, only: :create
end
