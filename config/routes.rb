Craigslist::Application.routes.draw do
  root to: 'posts#index'
  resources :users do
    resources :posts, :only => [:edit, :update]
  end
  resources :posts, :except => [:edit, :update]
  resources :categories

  resource :session, :only => [:new, :create, :destroy]

  get "/login"  => "sessions#new",    :as => :login
  get "/logout" => "sessions#destroy", :as => :logout
end
