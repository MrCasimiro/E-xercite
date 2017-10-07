Rails.application.routes.draw do

  get 'uipages/user_ui'
  get 'uipages/employee_ui'
  get 'uipages/admin_ui'

  get 'pages/home'
  get 'pages/main_ui'


  ##
  resources "contacts", only: [:new, :create]
  get '/contact', to: 'contacts#new', as: 'contact'

  get '/about', to: 'pages#sobre', as: 'about'
  get '/exercises', to: 'pages#exercicios', as: 'exercises' 
  get '/flexao', to: 'pages#flexao', as: 'flexao' 
   get '/squat', to: 'pages#squat', as: 'squat' 
  
  get '/treino', to: 'pages#ftreino', as: 'treino'
  
  get   '/fexercise', to: 'exercises#new', as: 'fexercise'
  post  '/fexercise', to: 'exercises#create'
  resources :exercises

  get '/user_ui', to: 'uipages#user_ui', as: 'user_ui'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  get   '/signup', to: 'people#new', as: 'signup'
  post  '/signup', to: 'people#create'
  resources :people
  resources :users

  get    '/login',   to: 'sessions#new', as: 'login'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
