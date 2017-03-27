Rails.application.routes.draw do
  #resources :posts, except: [:index]
  resources :subs
  resources :posts, only: [:create, :new, :edit, :update, :destroy]
  resources :posts, only: [:show] do
    resources :comments, only: [:new, :create]
  end
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:create, :new, :destroy]
  resources :comments, only: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
