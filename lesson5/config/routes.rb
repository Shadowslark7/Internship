Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "hospital#index"
  resources :patients 
  resources :physicians
  resources :diagnosis_items
  resources :appointments
end
