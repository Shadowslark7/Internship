Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "patients#index"
  resources :patients 
  resources :physicians
  resources :diagnosis_items
  resources :appointmants
end
