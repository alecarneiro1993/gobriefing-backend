Rails.application.routes.draw do
  resources :users
  
  namespace :api do
    namespace :sessions do
      post :authenticate
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
