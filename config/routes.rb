Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  
  authenticated :user do
    root to: 'tasks#index', as: :authenticated_root
  end

  root to: redirect('/login')

  resources :tasks, format: false
end
