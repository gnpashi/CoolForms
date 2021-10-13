Rails.application.routes.draw do
  resources :forms do
    resources :responses
  end
  root to: "forms#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
