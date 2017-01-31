Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/about" => "pages#about"
  get "/hygiene" => "pages#hygiene"
  get "/features" => "pages#features"

  resources :cooks do
    resources :dishes, except: [:index]
    resources :cook_places, only: [:destroy]
  end

  resource :cart, only: [:show]

  resources :order_items, only: [:create, :update, :destroy] do
    member do
      post 'increment'
      post 'decrement'
    end
  end

end
