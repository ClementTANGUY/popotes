Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/about" => "pages#about"

  resources :cooks do
    resources :dishes
  end

  resource :cart, only: [:show]

  resources :order_items, only: [:create, :update, :destroy]

end
