Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tasklists do
    resources :tasks, except: [:show, :index], shallow: true
  end

end
