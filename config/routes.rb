Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :plans, only: [:create, :destroy]
  resources :weeks, only: [:create, :update, :destroy]

  resources :practices do
    resources :plans, only: [:new]
    resources :comments, only: [:new, :edit]
  end

  resources :users, only: [:new, :show, :create] do
    resources :practices, only: [:index]
    resources :weeks, only: [:edit, :new, :past]
  end

  root to: 'welcome#home'
  get '/about', to: 'welcome#about'
  get '/login', :to => 'sessions#new', :as => :login
  get '/logout', to: 'sessions#destroy'

  get '/users/:user_id/past_weeks', to: 'weeks#past', :as => :past_weeks

  get '/auth/facebook/callback' => 'sessions#create'

end
