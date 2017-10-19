Rails.application.routes.draw do

  root 'sessions#new'

  get 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  resources :sessions, only: [:new, :create]

  resources :tasklists do
    resources :tasks, except: [:show, :index], shallow: true
  end

end
