Rails.application.routes.draw do

  get 'uipages/user_ui'

  get 'uipages/employee_ui'

  get 'pages/home'
  get 'pages/main_ui'

  ##
  resources "contacts", only: [:new, :create]
  get '/contact', to: 'contacts#new', as: 'contact'

  get '/about', to: 'pages#sobre', as: 'about'
  get '/user_ui', to: 'uipages#user_ui', as: 'user_ui'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  get   '/signup', to: 'users#new', as: 'signup'
  post  '/signup', to: 'users#create'
  resources :users

  get    '/login',   to: 'sessions#new', as: 'login'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
