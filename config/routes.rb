Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items
  resources :shipments, only: [:new, :create, :show]
  resources :shipment_items, only: [:create]
end
