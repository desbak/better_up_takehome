Rails.application.routes.draw do
  resources :appointments
  resources :availability_blocks
  resources :coaches
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
