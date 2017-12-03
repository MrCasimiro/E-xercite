Rails.application.routes.draw do
  root :to => 'pages#home'
  root :to => 'people/coaches#show', :constraints => lambda { |request| request.env['warden'].person.type == 'Coach' }
  root :to => 'people/users#show', :constraints => lambda { |request| request.env['warden'].person.type == 'User' }
  
  devise_for :people, controllers: { sessions: 'sessions', registrations: 'people'}
  devise_scope :people do
    get     '/sign_in' => 'sessions#new'
    post    '/sign_in' => 'sessions#create'
    delete  '/sign_out' => 'sessions#destroy'
    get     '/sign_up', to: 'people#new', as: 'signup'
    post    '/sign_up', to: 'people#create'
  end

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
  

  get '/gami', to: 'pages#gamification', as: 'gami'

   #formulário de criação de treino

   resources :workout_menu, only: [:show]

   resources :people, only: [:new, :create, :edit, :update] do

    resources :users do 
      member do 
        resources :conversations, only: [:create] do
            member do
                post :close
            end
          resources :messages, only: [:create]
          post 'messages', to: 'messages#create', as: 'user_messages'
        end
        get '/chat', to: 'chat#index', as: 'chat'
        get 'profile', 'setting'
      end
    end

    resources :coaches do
      member do
        resources :conversations, only: [:create] do
            member do
                post :close
            end
        resources :messages, only: [:create]
        end
        get '/chat', to: 'chat#index', as: 'chat'
        get 'users_profile', to: 'coaches#users_profile'
      end
    end
  end

  resources :users, only: [:show, :edit, :update] do
    resources :trainings, only: [:show, :end_workout]
    post 'end_workout', to: "trainings#end_workout"
    resources :diet_menu, only: [:show]
    resources :trainings,     only: [:show]
    resources :diet_menu,     only: [:show]
    resources :diseases,      only: [:update, :create, :destroy]
    resources :restrictions,  only: [:update, :create, :destroy] 
  end
  
  resources :users do
    get   'info',                       to: 'user_measures#info'
    get   'user_measures/show/:id',                       to: 'user_measures#show'
    get   'user_measures/new/:id',                       to: 'user_measures#new'
    post  'user_measures',              to: 'user_measures#create'
  end

  resources :coaches do
    get   'diets',              to: 'diets#show'
    post  'diets',              to: 'diets#create'
    resources :diets, only: [:show, :create]

    get   'foods',              to: 'foods#show'
    resources :foods, only: [:show, :create]

    get   'exercises',          to: 'exercises#show'
    resources :exercises, only: [:show, :create]

    get   'workouts',           to: 'workouts#new'
    resources :workouts, only: [:workouts_page, :create_do_workout, :create, :workouts_history]
    get   'workouts_page',      to: 'workouts#workouts_page'
    get   'workouts_history',   to: 'workouts#workouts_history'
    post  'workout_creations',  to: 'workouts#create_do_workout'
    post  'workout_end',        to: 'workouts#workout_score'

    get   '/diet_assign',       to: 'diet_assign#show'
    resources :diet_assign

    get   '/choose_diet',       to: 'choose_diet#show'
    post  '/choose_diet',       to: 'choose_diet#create'
    post  '/choose_diet/:id',   to: 'choose_diet#create'
    resources :choose_diet
  end


end
