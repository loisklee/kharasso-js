Rails.application.routes.draw do
  resources :plans
  resources :weeks
  resources :practices
  resources :users

  root to: 'welcome#home'
  get '/about', to: 'welcome#about'
  get '/login', :to => 'sessions#new', :as => :login
  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
