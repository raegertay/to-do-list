Rails.application.routes.draw do

  root 'tasklists#index'

  devise_for :users

  resources :tasklists do
    resources :tasks, except: [:show, :index], shallow: true
  end

end
