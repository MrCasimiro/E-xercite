Rails.application.routes.draw do
  get 'uipages/user_ui'

  get 'uipages/employee_ui'

  get 'pages/home'
  get 'pages/main_ui'
  get 'pages/sobre'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
end
