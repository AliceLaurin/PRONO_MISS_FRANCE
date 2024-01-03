Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :years, only: [:index, :show] do
    get 'myfifteens/others', to: 'myfifteens#others', on: :member
    get 'myfives/others', to: 'myfives#others', on: :member
    resources :groups, only: [:new, :create, :show]
    resources :myfifteens, only: [:new, :create, :index, :show, :destroy]
    resources :myfives, only: [:new, :create, :index, :show, :destroy]
    resources :my_winners, only: [:new, :create, :index, :show, :destroy]
    resources :real_winners, only: [:show]
    resources :real_top12s, only: [:show]
    resources :real_top5s, only: [:show]
    resources :misses, only: [:index, :show] do
      resources :categories, only: [:new, :create]
    end


  end

  resources :group_users, only: [:new, :create]

  # Defines the root path route ("/")
  # root "posts#index"
end
