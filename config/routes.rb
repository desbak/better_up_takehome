Rails.application.routes.draw do
  resources :appointments, only: [:new, :create]
  # resources :availability_blocks
  resources :coaches, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
