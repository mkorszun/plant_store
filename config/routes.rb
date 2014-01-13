PlantStore::Application.routes.draw do
  devise_for :users
  root :to => 'home#index'
  authenticate(:user) do
    resources :plants
  end

  namespace :api, defaults: {format: :json} do
    scope module: :v1 do
      match '/token' => 'tokens#create', :via => :get
      match '/:key(.:format)/plant/:id(.:format)' => 'plants#show', :via => :get
      match '/:key(.:format)/plant' => 'plants#index', :via => :get
      match '/:key(.:format)/kind' => 'kinds#index', :via => :get
    end
  end

end
