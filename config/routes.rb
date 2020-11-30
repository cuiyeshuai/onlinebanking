Rails.application.routes.draw do
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#verification'
  get 'success', to: 'sessions#success'

  # For static/dummy pages
  get '/pages/:page' => "pages#show"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
