PlantStore::Application.routes.draw do
  devise_for :users
  root :to => 'home#index'
  authenticate(:user) do
    resources :plants
    resources :kinds
  end
end
