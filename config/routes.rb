Rails.application.routes.draw do

  get '/login', to: 'sessions#login'
  get '/success', to: 'sessions#success'
  post '/login', to: 'sessions#verification'
  # Delete current session
  delete '/logout', to: 'sessions#destroy'

  # For static/dummy pages
  get '/pages/:page' => "pages#show"

  get'/adminlogin', to: 'admin_sessions#new'
  post'/adminlogin', to: 'admin_sessions#create'
  delete'adminlogout', to: 'admin_sessions#logout'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
