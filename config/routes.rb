Rails.application.routes.draw do
  resources :plans
  resources :weeks
  resources :practices do
    resources :plans, only: [:new]
    resources :comments, only: [:new, :edit]
  end
  
  resources :sessions, only: [:create]


  resources :users, only: [:new, :show, :create] do
    resources :practices, only: [:index]
    resources :weeks, only: [:edit, :new]
  end

  root to: 'welcome#home'
  get '/about', to: 'welcome#about'
  get '/login', :to => 'sessions#new', :as => :login
  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
