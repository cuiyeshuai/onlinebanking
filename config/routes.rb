Rails.application.routes.draw do
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#verification'
  get 'success', to: 'sessions#success'

  get'/adminlogin', to: 'admin_sessions#new'
  post'/adminlogin', to: 'admin_sessions#create'
  delete'adminlogout', to: 'admin_sessions#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
