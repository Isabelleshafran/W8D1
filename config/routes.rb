Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show, :new, :create, :destroy]

  resources :subs, except: [:destroy] do 
    resources :posts, only: [:create, :new]
  end

  resource :session, only: [:new, :create, :destroy]

  resources :posts, except: [:index, :create, :new] do 
    resources :comments, only: [:create, :new]
  end


end
