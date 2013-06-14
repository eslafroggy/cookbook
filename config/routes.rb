Cookbook::Application.routes.draw do
  resources :sessions, :only => [:new, :create] 
  match "signup" => 'users#new', :as => "signup"
  match "login" => 'sessions#new', :as => "login"
  match "logout" => 'sessions#destroy', :as => "logout"

 
  resources :comments
  resources :steps
  resources :ingredients
  resources :categories
  resources :users, :only => [:new, :create]
  root :to => 'recipes#index'
  
  

  get "recipes/index"

  get "recipes/new" 
  post "recipes/create"
  
  get "recipes/change/:id" => 'recipes#edit', :as => :edit_recipe
  put "recipes/update/:id" => "recipes#update", :as => :update_recipe
    # put "recipesupdate/3"
    
  delete "recipes/destroy/:id" => "recipes#destroy",  :as => :delete_recipe
    
  get "recipe/:id" => "recipes#show", :as => :recipe  
  
  root :to => "recipes#index"

end
