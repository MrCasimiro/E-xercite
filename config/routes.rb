Rails.application.routes.draw do
  root 'pages#home'

  get 'profiles/show'

  get 'profile/show'

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
  get '/burpee', to: 'pages#burpee', as: 'burpee' 
  
  #formulário de criação de treino
  get '/fworkouts', to: 'workouts#new', as: 'workouts'
  post '/fworkouts', to: 'workouts#create'
  resources :workouts

  get '/gami', to: 'pages#gamification', as: 'gami'


  get   '/fexercise', to: 'exercises#new', as: 'fexercise'
  post  '/fexercise', to: 'exercises#create'
  resources :exercises


  get   '/signup', to: 'people#new', as: 'signup'
  post  '/signup', to: 'people#create'

  resources :people do

    resources :users do 
      member do 
        get 'profile', 'setting'
      end
    end
    resources :coaches
    resources :profiles
  end

  get    '/login',   to: 'sessions#new', as: 'login'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :trainings, only: [:show]

  get 'coaches/show'
  get 'trainings/show'

  resources :diet_menu, only: [:show]
  get 'diet_menu/show'

  get '/foods', to: 'foods#show'
  resources :foods

  
  get '/diets', to: 'diets#show'
  post '/diets', to: 'diets#create'
  resources :diets

end
