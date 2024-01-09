Rails.application.routes.draw do
  devise_for :users
  root to: "years#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :years, only: [:index, :show] do
    get 'myfifteens/others', to: 'myfifteens#others', on: :member
    get 'mycinqs/others', to: 'mycinqs#others', on: :member
    get 'realfifteen', to: 'pages#realfifteen', on: :member
    get 'realcinq', to: 'pages#realcinq', on: :member
    get 'real_winner', to: 'pages#real_winner', on: :member
    get 'realclassement', to: 'pages#realclassement', on: :member
    get 'myclassement', to: 'pages#myclassement', on: :member
    resources :groups, only: [:new, :create, :show]
    resources :myfifteens, only: [:new, :create, :index, :show, :destroy]
    resources :mycinqs, only: [:new, :create, :index, :show, :destroy]
    resources :my_winners, only: [:new, :create, :index, :show, :destroy]
    resources :misses, only: [:index, :show] do
      resources :categories, only: [:new, :create, :edit, :update]
    end


  end

  resources :group_users, only: [:new, :create]

  # Defines the root path route ("/")
  # root "posts#index"
end
