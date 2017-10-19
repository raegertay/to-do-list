Rails.application.routes.draw do

  root 'sessions#new'

  get 'signup', to: 'users#new'
  get 'logout', to: 'sessions#destroy'

  resources :users, only: [:create]
  resources :sessions, only: [:new, :create]

  resources :tasklists do
    resources :tasks, except: [:show, :index], shallow: true
  end

end
