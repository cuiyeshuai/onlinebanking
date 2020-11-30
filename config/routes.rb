Rails.application.routes.draw do
  get 'login', to: 'sessions#login'
  post 'login', to: 'sessions#verification'
  get 'success', to: 'l_page#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
