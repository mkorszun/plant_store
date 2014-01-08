PlantStore::Application.routes.draw do
  devise_for :users
  root :to => 'home#index'
  authenticate(:user) do
    resources :plants
  end

  namespace :api, defaults: {format: :json} do
    scope module: :v1 do
      match '/token' => 'tokens#create', :via => :post
      match '/token' => 'tokens#destroy', :via => :delete
    end
  end

end
