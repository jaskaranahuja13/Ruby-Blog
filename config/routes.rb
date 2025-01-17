Rails.application.routes.draw do
  resources :replies
  get 'users/profile'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
     registrations: 'users/registrations'

  }
  get 'u/:id', to: 'users#profile', as: 'user'
  resources :posts do
    resources :comments do
      resources :replies, only: [:new, :create, :destroy]
    end
  end
  resources :posts do
    member do
      put "like" => "posts#like"
    end
  end
  get 'home' , to: "pages#home"
  get 'about' , to: "pages#about"


  root "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
